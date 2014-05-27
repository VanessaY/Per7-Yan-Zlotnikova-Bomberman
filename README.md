Bomberman
=========

Board
-----
2D array of objs

Objs
----
* Indestructible boxes
* Destructible boxes
* Powerups
* Boosts (opt)
* Characters
* Empty land
* Bombs
* Fire
* Monsters (opt)

Empty Land (class Item)
-----------------------
* Should the empty land be an item? should it instead be if null display this picture
* Picture
* ~~Location~~
* remove self from grid (check how gridworld does it)

Boxes (class Box extends Item)
------------------------------
* ~~Hits it takes to destroy~~
* ~~Hits taken~~

Indestructible (class IndestructibleBox extends Box)
----------------------------------------------------
* Nothing at all. Probably.

Destructible (class DestrucibleBox extends Box)
-----------------------------------------------
* takeHit (hits taken ++)
* drop powerup

Powerups (class Powerup extends Item)
-------------------------------------
* time until despawn
* despawn (ticks down)
* fade when almost despawned

Speed up (class SpeedUp extends Powerup)
----------------------------------------
* speedIncrease(player) (speed++)

Health up (class HealthUp extends Powerup)
------------------------------------------
* healthIncrease(player) (health++)

Bomb strength up (class StrengthUp extends Powerup)
---------------------------------------------------
* strengthIncrease(player) (strength++)

Bomb numbers up (class NumbersUp extends PowerUp)
-------------------------------------------------
* numbersIncrease(player) (number++)

Player
------
* Speed (in ms per box)
* Direction
* # bombs on field
* # max bombs allowed
* strength of bombs
* lives
* score
* thing they're riding (opt)

Bombs
-----
* Length of fire
* Time to detonation
* Location
* Person dropped by
* picture

Fire
----
* Time till despawn
* location
* picture
* 

To-Do list
----------
FIGURE OUT PROCESSING
