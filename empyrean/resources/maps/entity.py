from pyr import *

class MonsterBehavior(Behavior):
    def __init__(self):
        Behavior.__init__(self)
        self.physics = PhysicsBehaviorSlot()
        self.setSlot(self.physics)

    def update(self, entity, dt, env):
        # modify the entity
        entity.vel += Vec2f(0.01 * dt, 0)
        entity.pos += entity.vel * dt
        
def create():
    return MonsterBehavior()
