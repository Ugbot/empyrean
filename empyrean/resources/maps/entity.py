from pyr import *

logger = Logger('pyr.script.MonsterBehavior')

class MonsterBehavior(Behavior):
    physics = PhysicsBehaviorSlot()

    def __init__(self):
        Behavior.__init__(self)
        self.setSlot(self.physics)

    def update(self, entity, dt, env):
        # modify the entity
        entity.vel += Vec2f(0.01 * dt, 0)
        entity.pos += entity.vel * dt

        m = env.map
        logger.log(LogLevel.INFO, "Map %s" % m)
        for e in env.entities:
            logger.log(LogLevel.INFO, "Entity %s" % e.behavior.name)

def create():
    return MonsterBehavior()
