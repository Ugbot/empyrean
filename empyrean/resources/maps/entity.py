import pyr

class MonsterBehavior(pyr.Behavior):
    def __init__(self):
        pyr.Behavior.__init__(self)
        #self.physics = pyr.PhysicsBehaviorSlot()
        #self.setSlot(self.physics)

    def update(self, entity, dt, env):
        # modify the entity
        # pyr.log("%s: %s %s %s" % (self.name, entity, dt, env))

        #assert 0
        entity.setVel(0.1, 0)
        entity.setPos(entity.getVelX() + dt, entity.getVelY());
        #if entity.getPosX() == 0:
            #entity.setPos(-1.0,2.0)
            #entity.setVel(-1.8,-1.8)
        #pyr.log('%s %s %s %s' % (self, entity, env, dt) )
        #entity.setPos((entity.getPosX() + entity.getVelX() * dt),2.0)
        
def create():
    return MonsterBehavior()
