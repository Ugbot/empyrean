import socket
import threading
import time


print_packets = 0


class ScopedLock:
    def __init__(self, l):
        self.lock = l
        self.lock.acquire()
        
    def __del__(self):
        self.lock.release()

class World:
    lock = threading.RLock()
    connections = []

    def update(self, dt):
        l = ScopedLock(self.lock)

        for c in self.connections:
            c.update(dt)
        for c in self.connections:
            c.process_packets()
        for c in self.connections:
            c.broadcast(self.connections)

    def add_connection(self, conn):
        l = ScopedLock(self.lock)

        for c in self.connections:
            conn.send('added %s %d %f %f' % (conn.image, c.id, c.x, c.y))
        self.connections.append(conn)
        for c in self.connections:
            c.send('added %s %d %f %f' % (conn.image, conn.id, conn.x, conn.y))

    def remove_connection(self, conn):
        l = ScopedLock(self.lock)

        for c in self.connections:
            c.send('removed %d' % conn.id)
        self.connections.remove(conn)
        for c in self.connections:
            conn.send('removed %d' % c.id)
        

world = World()
 

__last_id = 0
def generate_id():
    global __last_id
    id = __last_id
    __last_id += 1
    return id

  
def bound(value, lo, hi):
    return min(max(value, lo), hi)


class Bullet:
    x = 0.0
    y = 0.0
    vx = 0.0
    vy = 0.0

    last_x = 0.0
    last_y = 0.0
    last_vx = 0.0
    last_vy = 0.0
    
    elapsed = 0.0
    total = 2.0

    def __init__(self, x, y, vx, vy):
        self.id = generate_id()
        self.image = "shot.png"
        self.x = x
        self.y = y
        self.vx = vx
        self.vy = vy

    def update(self, dt):
        self.last_x = self.x
        self.last_y = self.y
        self.last_vx = self.vx
        self.last_vy = self.vy
        
        self.x += dt * self.vx
        self.y += dt * self.vy
        self.elapsed += dt
        if self.elapsed > self.total:
            world.remove_connection(self)

    def process_packets(self):
        pass

    def broadcast(self, connections):
        pass

    def send(self, packet):
        pass


class ConnectionThread(threading.Thread):
    # socket

    lock = threading.RLock()
    packets = []

    # id

    logged_in = 0

    x  = 0.0
    y  = 0.0
    vx = 0.0
    vy = 0.0

    last_x = 0.0
    last_y = 0.0
    last_vx = 0.0
    last_vy = 0.0

    def __init__(self, socket):
        threading.Thread.__init__(self)
        self.socket = socket
        self.id = generate_id()
        self.image = "player.png"

    def run(self):
        print 'Connection!'
        print 'Peer Name: ' + str(self.socket.getpeername())
        print 'Sock Name: ' + str(self.socket.getsockname())

        world.add_connection(self)

        data = ''
        while 1:
            try:
                read = self.socket.recv(1024)
                if not len(read):
                    break
            except:
                break

            data += read.replace('\r', '')

            eol_index = data.find('\n')
            if eol_index != -1:
                line = data[0:eol_index]
                data = data[eol_index+1:]
                if self.queue_packet(line):
                    break

        world.remove_connection(self)

        print 'Disconnecting...'
        self.socket.close()

    def queue_packet(self, packet):
        if packet == "logout":
            return 1
        self.lock.acquire()
        self.packets.append(packet)
        self.lock.release()

    def process_packets(self):
        self.lock.acquire()
        for p in self.packets:
            self.process_packet(p)
        self.packets = []
        self.lock.release()

    def process_packet(self, packet):
        if print_packets:
            print "Processing packet: %s" % repr(packet)

        split = packet.split()
        if split:
            command = split[0]
            args = split[1:]
            if command == "login":
                self.logged_in = 1
                self.send("id %d" % self.id)
            elif command == "logout":
                return 1
            elif command == "addvel":
                self.vx += float(args[0])
                self.vy += float(args[1])
            elif command == 'fire':
                world.add_connection(Bullet(self.x, self.y,  1,  1))
                world.add_connection(Bullet(self.x, self.y, -1,  1))
                world.add_connection(Bullet(self.x, self.y, -1, -1))
                world.add_connection(Bullet(self.x, self.y,  1, -1))

    def send(self, packet):
        if print_packets:
            print "Sending: " + repr(packet)
        try:
            self.socket.sendall(packet + '\n')
        except:
            pass

    def update(self, dt):
        self.last_x = self.x
        self.last_y = self.y
        self.x = bound(self.x + self.vx * dt, -1.5, 1.5)
        self.y = bound(self.y + self.vy * dt, -1.5, 1.5)

        self.last_vx = self.vx
        self.last_vy = self.vy

    def broadcast(self, connections):
        for c in connections:
            self.send("update %d %f %f %f %f" %
                      (c.id, c.x, c.y, c.vx, c.vy))


class ListenerThread(threading.Thread):
    def run(self):
        listener = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        listener.bind(('', 8765))
        listener.listen(5)
        s = listener.accept()
        while s:
            ConnectionThread(s[0]).start()
            s = listener.accept()


def main():
    ListenerThread().start()

    last_update = time.time()
    while 1:
        now = time.time()
        dt = now - last_update

        world.update(dt)
        time.sleep(1 / 10.0)

        last_update = now

if __name__ == '__main__':
    main()
