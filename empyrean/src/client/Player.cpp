#include "ArmorPool.h"
#include "Player.h"
#include "WeaponPool.h"


namespace pyr {

    Player::Player() {
    }

    void Player::getVitalityUpdate(int& current, int& max) {
        current = _currentVitality;
        max = _maxVitality;
    }

    void Player::getEtherUpdate(int& current, int& max) {
        current = _currentEther;
        max = _maxEther;
    }

}
