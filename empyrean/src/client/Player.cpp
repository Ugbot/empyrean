#include "ArmorPool.h"
#include "Player.h"
#include "WeaponPool.h"


namespace pyr {

    Player::Player() {
        // Initializing frenzy! // TEMP TESTING -> real values commented out
        _currentEther = 25; //0;
        _maxEther = 100; //0;
        _currentVitality = 10; //0;
        _maxVitality = 100; //0;
        _armor = the<ArmorPool>().getArmor("Leather");
        _meleeWeapon = the<WeaponPool>().getWeapon("Short Sword");
        _rangeWeapon = the<WeaponPool>().getWeapon("Pistol");

    }

    void Player::decrVitality(int decr) {
        _currentVitality -= decr;
        if (_currentVitality < 0) {
            _currentVitality = 0;
        }
    }

    void Player::incrVitality(int incr) {
        _currentVitality += incr;
        if (_currentVitality > _maxVitality) {
            _currentVitality = _maxVitality;
        }
    }

    void Player::decrEther(int decr) {
        _currentEther -= decr;
        if (_currentEther < 0) {
            _currentEther = 0;
        }
    }

    void Player::incrEther(int incr) {
        _currentEther += incr;
        if (_currentEther > _maxEther) {
            _currentEther = _maxEther;
        }
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
