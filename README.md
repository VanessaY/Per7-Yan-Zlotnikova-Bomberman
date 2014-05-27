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
* Picture
* ~~Location~~

Boxes (class Box extends Item)
------------------------------
* Hits it takes to destroy
* Hits taken

Indestructible (class IndestructibleBox extends Box)
----------------------------------------------------
* Nothing at all. Probably.

Destructible (class DestrucibleBox extends Box)
-----------------------------------------------
* takeHit (hits taken ++)

Powerups (class Powerup extends Item)
-------------------------------------
* Location
* picture
* time until despawn
* Speed up
* Bomb power up
* Num bombs up
* Health up

Player
------
* Picture
* Speed (in ms per box)
* Direction
* Location
* # bombs on field
* # max bombs allowed
* range of bombs
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
