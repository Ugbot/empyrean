import pyr

class MonsterBehavior(pyr.Behavior):
    def __init__(self):
        pyr.Behavior.__init__(self)
        self.physics = pyr.PhysicsBehaviorSlot()
        self.setSlot(self.physics)

    def update(self, entity, dt, env):
        # modify the entity
        # pyr.log("%s: %s %s %s" % (self.name, entity, dt, env))
        pass
        
def create():
    return MonsterBehavior()
