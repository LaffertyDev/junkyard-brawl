# Design

## MVP

* Max and Freak fully realized
* Single enemy type
* Health Pickups and Energy Pickups for Max
* Enemies chase closest player character and attack them
* Health bar UI
* Count enemies killed
* Simple background
* Simple tiles

## Colour Palette

* https://www.inquirer.com/resizer/YmSf7Tno53k6Zy7PEQwjyLkpAGs=/760x507/smart/filters:format(webp)/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/5XQ3LMMGUBHPROYKY4RRT33HQU.jpg

## Camera Design

* When in Max, camera zooms out
* 16:9 320 x 180 when in max
* 4:3 in pillarbox 240 X 180 when in freak

## Enemy Design

* 16x16 enemies (for small)
* ~64x64 enemies (for large)
* ~96x96 boss

How do they chase the player?

* Closest player character wins?


## Robot Design

### MAX

* Big robotic giant. Think iron giant. Iron. Metal. Steel.
* Big
* Slow
* Needs energy
* Somewhat unresponsive
* Camera "Zooms Out"
	* It looks "forward" to where he is facing, so he is always in the bottom 1/3 of the screen
	* It opens up the peripheral vision 
	* Sees a 16:9 visual
* 64x64 (VERY APPROPRIATE)

How does Max move?

* He's a mech. He has a slow wind up, then a lurch forward.
* Quadroped, so two feet move at the same time
* Holding a direction will move the two proper feet in that direction
* if a user stops holding W before they finish their movement animation, the feet return and max does not move forward
* if the feet finish their animation, the other two feet will start their animation
* max's torso will then move forward. This is uncancellable

### FREAK

* More cute than machine
* Fast and squirel-y
* Extremely responsive
* Camera "Zooms In"
	* Keep hims centered
	* Unhides the top clutter, so you can see passageways (that only Freak and other small robots can traverse)
	* 

* 32x32 pixels roughly (maybe a little large visually?)

### MAX + FREAK

How do I implement the boarding mechanic?

* Added State on Max ("Unpowered"). On `MechMovement`, `MechWeapon`
* Added State on Freek (`Piloting` / `Idle` / `Moving` / `Boarding` etc.) <-- this one makes sense

* New "meta-state"
	* "MechState"
		* Powered -> enable movement processing
		* Unpowered -> disable movement

## UI

### Menu Start

* Start Game
* Credits
* Rate Game

### Pause Menu

* Unpause
* Rate Game
* Exit Game (if not web)

## Game Scenes


### Start

* Camera starts on FREAK
* FREAK plays a fast animation, and scurries into MAX
* There is an enemy that starts, player sees a prompt for "Smash"
* MAX is low energy, sees a prompt to eject
* Glowing powerup is visible for ENERGY
* Glowing powerup is visible for HEALTH


## Design Thoughts

There is a dissonance between the two designs. Right now Freak interacts with Max. How does Max interact with Freak?

Solves?

* Have Freak and Max exist in two completely different scales. (Problem: Need 2x the number of assets.)
	* Use SVG (Godot doesn't support it for 2d for scaleable shit)
	* Use 3D (would be my first go, and it would still look weird with the detail mismatch)
	* Just deal with it?
	* Have Freak be able to help Max with some attacking if he's low power?


* Screensize when in max is just larger, when in freak, that larger part is blacked out


What can max do that Freak cannot?

* Swing a giant hammer
* Open up or close passageways
* Fight robotic elephants

What can freak do that max cannot?

* Move fast
* Turn on a dime
* Enter small areas
* FIGHT WHAT?
* What if he had a little net?
