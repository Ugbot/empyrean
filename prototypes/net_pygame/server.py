import socket
import threading
import time

class World:
    lock = threading.Lock()
    connections = []

    def update(self, dt):
        self.lock.acquire()
        for c in self.connections:
            c.update(dt)
        for c in self.connections:
            c.broadcast(self.connections)
        self.lock.release()

    def add_connection(self, conn):
        self.lock.acquire()
        self.connections.append(conn)
        for c in self.connections:
            c.send('added %d' % conn.id)
        self.lock.release()

    def remove_connection(self, conn):
        self.lock.acquire()
        for c in self.connections:
            c.send('removed %d' % conn.id)
        self.connections.remove(conn)
        self.lock.release()

world = World()
 

__last_id = 0
def generate_id():
    global __last_id
    id = __last_id
    __last_id += 1
    return id


class ConnectionThread(threading.Thread):
    # socket
    # id

    logged_in = 0

    x  = 0.0
    y  = 0.0
    vx = 0.0
    vy = 0.0

    def __init__(self, socket):
        threading.Thread.__init__(self)
        self.socket = socket
        self.id = generate_id()

    def run(self):
        print 'Connection!'
        print 'Peer Name: ' + str(self.socket.getpeername())
        print 'Sock Name: ' + str(self.socket.getsockname())

        world.add_connection(self)

        data = ''
        while 1:
            read = self.socket.recv(1024)
            if not len(read):
                break

            data += read.replace('\r', '')

            eol_index = data.find('\n')
            if eol_index != -1:
                line = data[0:eol_index]
                data = data[eol_index+1:]
                if self.process_packet(line):
                    break

        world.remove_connection(self)

        print 'Disconnecting...'
        self.socket.close()

    def process_packet(self, packet):
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

    def send(self, packet):
        print "Sending: " + repr(packet)
        self.socket.sendall(packet + '\n')

    def update(self, dt):
        self.x += self.vx * dt
        self.y += self.vy * dt

    def broadcast(self, connections):
        for c in connections:
            self.send("update %d %f %f" % (c.id, c.x, c.y))


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
        time.sleep(1 / 20.0)

        last_update = now

if __name__ == '__main__':
    main()
