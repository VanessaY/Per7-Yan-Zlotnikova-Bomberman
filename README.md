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

Empty Land
----------
* Picture

Boxes
-----
* Location
* Hits it takes to destroy
* Hits taken
* possibility to drop powerup

Indestructable extends boxes
----------------------------
* picture

Destructable extends boxes
--------------------------
* picture

Powerups
--------
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
* Speed
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

