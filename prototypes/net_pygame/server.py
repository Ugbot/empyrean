import socket
import threading

class ConnectionThread(threading.Thread):
    def __init__(self, socket):
        threading.Thread.__init__(self)
        self.socket = socket

    def run(self):
        print 'Connection!'
        print 'Peer Name: ' + str(self.socket.getpeername())
        print 'Sock Name: ' + str(self.socket.getsockname())

        data = ''
        while not self.logged_out:
            read = self.socket.recv(1024)
            if len(read) == 0:
                break

            data += read.replace('\r', '')

            eol_index = data.find('\n')
            if eol_index != -1:
                line = data[0:eol_index]
                self.process_packet(line)
                data = data[eol_index+1:]
        
        print 'Disconnecting...'
        self.socket.close()

    def process_packet(self, packet):
        if packet == "login":
            if self.logged_in:
                print "Can't log in twice!"
            else:
                self.logged_in = 1
        elif packet == "logout":
            if self.logged_out:
                print "Can't log out twice!"
            else:
                self.logged_out = 1
        else:
            print "Unknown packet: " + repr(packet)

    logged_in = 0
    logged_out = 0


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
    thread = ListenerThread()
    thread.start()
    thread.join()
        

if __name__ == '__main__':
    main()
