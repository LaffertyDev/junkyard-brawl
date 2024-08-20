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
* [Mon x] Add drop system (so enemies who die drop REPAIR TOKENS)
* [Mon x] Enable Freek to carry a single item
* [Mon x] If Freek boards max while carrying an item, he will consume it and use it
* [Mon x] MAX cannot die, he can always be repaired by freek
* [Mon x] Make MAX move a little faster
* [Mon x] Design and build tutorial and starting area
* [Mon x] Design Swiper base
* [Mon x] Animate Swiper movement, attack, and death animations
* [Sun x] Hammer should have a windup "charge" animation
* [Sun x] Hammer should wind down
* [Mon x] Design Max base and legs
* [Mon x] Animate Max Hammer
* [Sun x] Enemies should be knocked back
* [Mon x] Implement GUI theme
* [Mon x] Make main menu a little spiffier
* [Mon x] Design Freek base
* [Mon x] Animate Freek Movement

* [Tue x] Design and build Build arena
* [Tue x] Design five rooms
* [Tue x] Put mechs in the rooms that activate when the round starts
* [Tue x] Round starts after you destroy that rooms gate
* [Tue x] From there, if I have time, make a boss and a win screen
* [Tue x] Update game rate button to point to GMTK listing
* [Tue x] Design and build how enemies spawn in the arena and fight
* [Tue x] Design win condition
* [Tue x] Build win condition
* [Tue x] Finalize the arena scene visuals
* [Tue x] Animate max take damage
* [Tue x] Add swiper attack track
* [Tue x] Add engine hum when in Max (does the rotation count?)
* [Tue x] Add swiper move track
* [Tue x] Add eject button sound
* [Tue x] Add pilot button sound
* [Tue x] BUG: Enemies will constantly follow FREEK if he boards MAX and not reacquire a target
* [Tue x] BUG: IF max dies, the mechs will swarm him because they won't retarget if a node is dead but is otherwise valid
* [Tue x] Add freek move track
* [Tue x] BUG: Hammer does not hit enemy multiple time


ACTIVE BUGS:

YOU FOUND A BUG.
* State system with timers breaks the model of the state system.
* A timer or other delayed execution task will resume executing.
* So you need to check if the current state is still active whenever a delayed task comes about.

* BUG: Animation connections in the state tree will replay and error out
* BUG: At least on macos, Godot4 has a weird audio popping sound

EMILY NOTES:

* Repair wrench does not perfectly insinuate "Heal Max" visually
* Max icon is not obvious its supposed to be a camera


### Discard Improvements

Ejection:

* Animate Freek boarding Max
* Animate Freek ejecting from Max

AUDIO EFFECT WORK
* Add button interaction sounds

UI Work
* Make Textured bars animate and be better 

Camera UX Improvements

* Camera should _lead_ Freek
* Camera on Max should lead him so he's looking ahead, not center
* Tune screen shake
* Body should lurch backwards when hammer activates