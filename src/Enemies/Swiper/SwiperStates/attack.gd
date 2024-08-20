extends EnemyStateBase

# HACK - This sucks
var is_cancelled = false

func enter(_previous_state_path: String, _data := {}) -> void:
	is_cancelled = false
	swiper_instance._swiper_sprites.play("attack_windup")
	swiper_instance._swiper_sprites.animation_finished.connect(on_windup_complete, CONNECT_ONE_SHOT)

func on_windup_complete() -> void:
	if is_cancelled:
		return
	swiper_instance._swiper_sprites.play("attack")
	swiper_instance._swiper_sprites.animation_finished.connect(on_attack_complete, CONNECT_ONE_SHOT)
	var bodies = swiper_instance._attack_radius.get_overlapping_bodies()
	for body in bodies:
		body.take_damage(1)

func on_attack_complete() -> void:
	if is_cancelled:
		return
	finished.emit(IDLE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "TakeDamage":
		is_cancelled = true
		finished.emit(TAKE_DAMAGE)
