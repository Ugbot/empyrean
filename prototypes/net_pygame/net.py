import pygame
import threading
import socket
from pygame.locals import *


entities = []


class Entity:
    x = 0.5
    y = 0.5


class NetworkThread(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.connect(('localhost', 8765))

    def run(self):
        print "Connected to server"
        
        data = ''
        while 1:
            read = self.socket.recv(1024)
            if len(read) == 0:
                break

            data += read.replace('\r', '')

            eol_index = data.find('\n')
            if eol_index != -1:
                line = data[0:eol_index]
                self.process_packet(line)
                data = data[eol_index+1:]

        print "Disconnected from server"
        
        self.socket.close()

    def process_packet(self, line):
        print "Processing packet: " + line

    def login(self):
        self.socket.sendall('login\n')

    def logout(self):
        self.socket.sendall('logout\n')

class ServerConnection:
    net_thread = NetworkThread()

    def __init__(self):
        self.net_thread.start()
    
    def login(self):
        self.net_thread.login()

    def logout(self):
        self.net_thread.logout()
        


def main():
    pygame.init()
    screen = pygame.display.set_mode((640, 480))
    pygame.display.set_caption('Empyrean Net Test')

    clock = pygame.time.Clock()

    player = pygame.image.load("player.png")
    shot   = pygame.image.load("shot.png")

    conn = ServerConnection()
    conn.login()

    done = 0
    while not done:
        dt = clock.tick(60)
        
        for event in pygame.event.get():
            if event.type is QUIT:
                done = 1
                break
            elif event.type is KEYDOWN and event.key is ESCAPE:
                done = 1
                break
        pygame.display.flip()

    conn.logout()

if __name__ == '__main__':
    main()
