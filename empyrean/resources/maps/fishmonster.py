import math
import pyr
from pyr import *

logger = Logger('pyr.script.MonsterBehavior')

class MonsterBehavior(pyr.Behavior):
    def __init__(self):
        pyr.Behavior.__init__(self)
        self.state = "scanning"
        self.sightrange = 5
        self.direction = [0,0]
        self.speed = 4

    def normalize(self, p1):
        length = math.sqrt(p1[0]*p1[0] + p1[1]*p1[1])
        return Vec2f(p1[0]/length, p1[1]/length)

    def calcDistance(self,p1,p2):
        xd = p1[0] - p2[0]
        yd = p1[1] - p2[1]
        return math.sqrt(xd*xd + yd*yd)

    def isPlayer(self, entity):
        return entity.behavior.name == "player"

    def getPlayerPos(self, env):
        for aEntity in env.entities:
            if self.isPlayer(aEntity):
                return aEntity.pos
        return Vec2f(-10000,-10000) # should be sufficient to never be close.

    def distToPlayer(self, entity,env):
        mPos = entity.pos
        return self.calcDistance(mPos,self.getPlayerPos(env))

    def findDirection(self,entity,dt,env):
        mPos = entity.pos
        pPos = self.getPlayerPos(env)
        #pPos[1] = pPos[1] + 1.8
        self.direction = self.normalize(pPos-mPos)
        self.stopPoint = mPos + self.direction*10

    def moveDirection(self,entity,dt):
        mPos = entity.pos
        mPos[0] = mPos[0] + self.speed*self.direction[0]*dt
        mPos[1] = mPos[1] + self.speed*self.direction[1]*dt
        entity.pos = mPos

    def running(self,entity,dt,env):
        self.moveDirection(entity,dt)
        if self.calcDistance(entity.pos,self.stopPoint) < 1:
            self.state = "scanning"
        if self.distToPlayer(entity,env) > self.sightrange+1:
            self.state = "scanning"

    def scanning(self, entity, dt, env):
        if self.distToPlayer(entity,env) < self.sightrange:
            self.findDirection(entity,dt,env)
            self.state = "attacking"

    def attacking(self, entity, dt, env):
        self.moveDirection(entity,dt)
        if self.distToPlayer(entity,env) < 2:
            action = Action()
            entity.behavior.addAction(action)
            self.state = "running"
        elif self.distToPlayer(entity,env) > self.sightrange+1:
            self.state = "scanning"

    def update(self, entity, dt, env):
       if self.state == "scanning":
           self.scanning(entity,dt,env)
       elif self.state == "attacking":
           self.attacking(entity,dt,env)
       elif self.state == "running":
           self.running(entity,dt,env)

def create():
    return MonsterBehavior()
