# TODO


* [Fri x] Pick game and do basic design
* [Fri x] Setup Godot Project
* [Fri x] Setup Screen 2D settings

* [Sat x] Choose Pixel Scale
* [Sat x] Decide what max and freak should look like
* [Sat x] Build Todolist
* [Sat x] Make max move forward and backwards
* [Sat x] Make max move side to side
* [Sat x] Make max rotate
* [Sat x] Make max attack
* [Sat x] scaffold UX
* [Sat x] Make Freek move forward and backwards
* [Sat x] Make Freek move side to side
* [Sat x] Add eject/board button
* [Sat x] Enable Freek to board max
* [Sat x] Enable Freek to eject from Max

* [Sun x] Make camera blur out into a pillarbox mode when in Freek
* [Sun x] Make camera follow Freek or max, whoever is active
* [Sun x] Make it so you can only enter Max if you are near him
* [Sun x] Make it so when Freek ejects he is placed near the mech
* [Sun x] Add basic large enemy
* [Sun x] Make basic large enemy follow closest person
* [Sun x] Make enemy basic attack do damage and chip away health bar
* [Sun x] Add health bar for Max and wire it up
* [Sun x] Add health bar for Freek and wire it up
* [Sun x] Make max attack actually do damage
* [Sun x] Add spawn for basic large enemy
* [Sun x] Add defeat screen for when max or freek take damage and decide how defeat and victory work
* [Sun x] Add pause menu
* [Sun x] Add main menu scene
* [Sun x] Add automated build to web
* [Sun x] Add basic sound effects
* [Sun x] Add screen shake
* [Sun x] Find a better rotation sound

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

## POST JAM THOUGHTS

Emily Playtest:
* Did not know why you couldn’t pick up a wrench in max. Should have a blurb about that.
* Squirrel hit box for picking up wrench is small. Should make it about 25% bigger to account for how fast he is.
* She did not get the turret controls. Not sure how to fix that.
* Emily frantically looked for a wrench in a level. Need to have a free wrench easily available in every level
* Emily id not understand why you can only hold one wrench. Consider allowing you to stack them and add a UI if you are at your limit

Random feedback from itch:
* Should have a button to eject from max and repilot so you don't have to click. Clicking is awkward.
* Movement felt terrible in MAX

My personal thoughts:
* Shadows under enemies don't work
* Level design looks like butts and needs an overhaul.
* SO much tech debt that bothers me.

MARKETING
* The gifs text is too small
* The gifs are grainy
* The gifs take too long to setup and use and export as a video

One week later me bad/improvement thoughts:

* [Sound] Sound effect on junkyard king lacks "punch"
* [Sound] Swiper attack is wrong. It feels like a dagger instead of something crunchy.

* [Pixel Art] Shadows on the mechs still look terrible
* [Pixel Art] Feet movement on max looks bad
* [Pixel Art] SWIPER mech feet "air" animation looks like its crying.

* [Level Design] World space looks flat and uninviting
* [Level Design] Mech bay starting area looks trash
* [Level Design] Shipping containers don't look good.
* [Level Design] Tutorial text in the world feels out of place and literally placed in. Because it is.
* [Level Design] Junkyard Gate looks bad.
* [Level Design] Tutorial text is bad and repeats "Repair him"

* [Visuals] No animation for repairing, boarding, or ejecting from max feels bad
* [Visuals] Z-index fighting. Freek/Max should always be on top.
* [Visuals] Squirrel movement sounds don't sound good.

* [Gameplay] MAX movement feels hollow. No sounds. Looks bad. Feels bad.
* [Gameplay] Going straight into the world from a button with no short cutscene feels... not great?
* [Gameplay] Max becoming inoperatonal feels random and uneventful.
* [Gameplay] Max hammer needs to reach just a little farther
* [Gameplay] Max hammer should be "bankable" and not cooldown immediately. Letting the player "revv up" the hammer
* [Gameplay] Junkyard King feels random. Like, suddenly you see this big mech? it lacks "oomf"

* [Art Direction] there is not a cohesive "shadow" being cast anywhere which makes the game look bad.
* https://www.gamedeveloper.com/programming/graveyard-keeper-how-the-graphics-effects-are-made
* https://www.codeandweb.com/spriteilluminator
* https://www.gdquest.com/tutorial/godot/2d/lighting-with-normal-maps/
* https://docs.godotengine.org/en/stable/tutorials/2d/2d_lights_and_shadows.html#normal-and-specular-maps
* https://azagaya.itch.io/laigter

* [GUI] The health bar looks terrible
* [GUI] Repair wrench icon looks bad, out of place, and is unintuitive

* [Project] No icon

* [Bug]: Animation connections in the state tree will replay and error out
* [Bug]: At least on macos, Godot4 has a weird audio popping sound
* [Bug] State system does not work well with scenetree events. Interrupting is bad. A timer/other delayed execution will still fire.

* [Marketing] cut screenshots in gif form look bad.

EMILY NOTES:

* Repair wrench does not perfectly insinuate "Heal Max" visually
* Max icon is not obvious its supposed to be a camera

IAN THOUGHTS:

* "Was it supposed to end by killing that one random mech?"