import pyr

class MonsterBehavior(pyr.Behavior):
    def __init__(self):
        pyr.Behavior.__init__(self)
        self.physics = pyr.PhysicsBehaviorSlot()
        self.setSlot(self.physics)

    def update(self, entity, dt, env):
        # modify the entity
        entity.setVel(0.01, 0)
        entity.setPos(entity.getPosX() + entity.getVelX() + dt,
                      entity.getPosY());
        
def create():
    return MonsterBehavior()
