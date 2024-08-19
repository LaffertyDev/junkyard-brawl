# TODO

[Sat x] Build Todolist

[Fri x] Pick game and do basic design
[Fri x] Setup Godot Project
[Fri x] Setup Screen 2D settings
[Sat x] Choose Pixel Scale
[Sat x] Decide what max and freak should look like

[Sat x] Make max move forward and backwards
[Sat x] Make max move side to side
[Sat x] Make max rotate
[Sat x] Make max attack

[Sat x] scaffold UX

[Sat x] Make Freek move forward and backwards
[Sat x]Make Freek move side to side

[Sat x] Add eject/board button
[Sat x] Enable Freek to board max
[Sat x] Enable Freek to eject from Max

[Sun x] Make camera blur out into a pillarbox mode when in Freek
[Sun x] Make camera follow Freek or max, whoever is active
[Sun x] Make it so you can only enter Max if you are near him
[Sun x] Make it so when Freek ejects he is placed near the mech

[Sun x] Add basic large enemy
[Sun x] Make basic large enemy follow closest person
[Sun x] Make enemy basic attack do damage and chip away health bar
[Sun x] Add health bar for Max and wire it up
[Sun x] Add health bar for Freek and wire it up
[Sun x] Make max attack actually do damage

[Sun x] Add spawn for basic large enemy
[Sun x] Add defeat screen for when max or freek take damage and decide how defeat and victory work
[Sun x] Add pause menu
[Sun x] Add main menu scene
[Sun x] Add automated build to web

[Sun x] Add basic sound effects
[Sun x] Add screen shake
[Sun x] Find a better rotation sound


* [Mon x] Pick final game shape

* [Mon x] Make Max and Freek icon sprites


Make Freek Useful:
* [Mon x] Add drop system (so enemies who die drop REPAIR TOKENS)
* [Mon x] Enable Freek to carry a single item
* [Mon x] If Freek boards max while carrying an item, he will consume it and use it
* [Mon x] MAX cannot die, he can always be repaired by freek
* BUG: Enemies will constantly follow FREEK if he boards MAX and not reacquire a target

Max Movement UX Improvements
* Add sound for foot windup
* Add sound for when a foot "slams" down
* Fix pixel jitter when max body is moving

GAME FEEL
* Enemies should have more than 1 hp
* Enemies should spawn slowly
* [Mon x] Make MAX move a little faster
* Add pickup attachments for Freek to give to Max? (A gun would be pretty lit.)


* Freek takes damage if he gets stepped on or touches a robot and slides back from the direction of the robot

GAMEPLAY TODO
* [Mon x] Design and build tutorial and starting area
* Design and build Build arena
	(How do enemies spawn? What is your player goal?)
* Design win condition
* Build win condition
* Iterate on some progression

ASSET TODO

* Design Max base and legs
* Design Freek base
* Design Swiper base
* Design base level assets (tileset, walls, doodads)
* Animate Freek Movement
* Animate Max Hammer
* Animate Max take damage
* Animate Freek boarding Max
* Animate Freek ejecting from Max
* Animate Swiper movement, attack, and death animations

AUDIO EFFECT WORK
* Add battle music
* Add menu music (?)
* Add button interaction sounds

UI Work
* Implement GUI theme
* Make main menu a little spiffier
* Make Textured bars animate and be better

Hammer UX Improvements
* [Sun x] Hammer should have a windup "charge" animation
* [Sun x] Hammer should wind down
* [Sun x] Enemies should be knocked back
* Tune screen shake
* Body should lurch backwards when hammer activates

Camera UX Improvements

* Camera should _lead_ Freek
* Camera on Max should lead him so he's looking ahead, not center


ACTIVE BUGS:

YOU FOUND A BUG.
* State system with timers breaks the model of the state system.
* A timer or other delayed execution task will resume executing.
* So you need to check if the current state is still active whenever a delayed task comes about.
