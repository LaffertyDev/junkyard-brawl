extends EnemyStateBase

var target: Node2D

var previous_pilot_state: Enums.PilotState
func enter(_previous_state_path: String, data := {}) -> void:
	target = data.target
	swiper_instance._swiper_sprites.play("move")
	swiper_instance._footstep_sounds.play()
	previous_pilot_state = PlayerState.current_pilot_state

func update(_delta: float) -> void:
	if swiper_instance.current_health <= 0:
		finished.emit(DIE)

func physics_update(delta: float) -> void:
	if not target:
		target = null
		finished.emit(IDLE)
		return
		
	if previous_pilot_state != PlayerState.current_pilot_state:
		finished.emit(IDLE)
		return
		
	# rotate the sprite to always face target
	var angle_to = swiper_instance.position.angle_to_point(target.position)
	var octant = int(round( 8 * angle_to / (2*PI) + 8 )) % 8;
	swiper_instance._swiper_sprites.rotation = octant * PI / 4 - PI / 2
	
	var bodies = swiper_instance._attack_radius.get_overlapping_bodies()
	if bodies.size() > 0:
		finished.emit(ATTACK)

	# move closer.
	const velocity = 50
	var direction_to = swiper_instance.position.direction_to(target.position)
	swiper_instance.position += direction_to * velocity * delta

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "TakeDamage":
		finished.emit(TAKE_DAMAGE)

func exit() -> void:
	swiper_instance._footstep_sounds.stop()
