from pyr import *
import math

logger = Logger('pyr.script.MonsterBehavior')

def distance(p1, p2):
    xd = p1[0] - p2[0]
    yd = p1[1] - p2[1]
    return math.sqrt(xd*xd + yd*yd)

def isPlayer(entity):
    return entity.behavior.name == "player"

def getClosestPlayer(pos, env):
    closest = None
    d = None
    for e in filter(isPlayer, env.entities):
        if closest:
            if distance(pos, e.pos) < d:
                closest = e
                d = distance(pos, e.pos)
        else:
            closest = e
            d = distance(pos, e.pos)
    return closest

class MonsterBehavior(Behavior):
    def __init__(self):
        Behavior.__init__(self)
        self.physics = PhysicsBehaviorSlot()
        self.setSlot(self.physics)

        # It would be nice if we could start in some sort of animation.
        self.physics.groundDir = Vec2f(1, 0)

        self.wait = 0

    def update(self, entity, dt, env):
        if self.wait > 0:
            self.wait -= dt
            self.physics.desiredAccel = Vec2f(0, 0)
            self.physics.desiredGroundSpeed = 0
            entity.beginAnimationCycle('idle')
            return
        
        player = getClosestPlayer(entity.pos, env)
        if player:
            logger.log(LogLevel.WARN, "Found player!")

            d = distance(entity.pos, player.pos)
            if d > 1 and d < 5:
                if player.pos[0] < entity.pos[0]:
                    #logger.log(LogLevel.WARN, "Moving to the left")
                    self.physics.desiredAccel = Vec2f(-12, 0)
                    self.physics.desiredGroundSpeed = -2
                    self.physics.facingRight = False
                    entity.sendAppearanceCommand('Face Left')
                    entity.beginAnimationCycle('walk')
                elif player.pos[0] > entity.pos[0]:
                    #logger.log(LogLevel.WARN, "Moving to the right")
                    self.physics.desiredAccel = Vec2f(12, 0)
                    self.physics.desiredGroundSpeed = 2
                    self.physics.facingRight = True
                    entity.sendAppearanceCommand('Face Right')
                    entity.beginAnimationCycle('walk')
            elif d < 1:
                off = player.pos[0] - entity.pos[0]
                if self.physics.facingRight and off > 0:
                    entity.behavior.addAction(Action())
                    entity.beginAnimation('attack')
                    self.wait = 1.0
                if not self.physics.facingRight and off < 0:
                    entity.behavior.addAction(Action())
                    entity.beginAnimation('attack')
                    self.wait = 1.0
            else:
                self.physics.desiredAccel = Vec2f(0, 0)
                self.physics.desiredGroundSpeed = 0
                entity.beginAnimationCycle('idle')

def create():
    return MonsterBehavior()
