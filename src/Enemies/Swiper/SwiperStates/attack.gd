extends EnemyStateBase

func enter(_previous_state_path: String, data := {}) -> void:
	var target = data.target
	if target and is_instance_valid(target):
		swiper_instance._swiper_sprites.animation = "attack"
		await get_tree().create_timer(0.25).timeout
		target.take_damage(1)
	finished.emit(IDLE)
