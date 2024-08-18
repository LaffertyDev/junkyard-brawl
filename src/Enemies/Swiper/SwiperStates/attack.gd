extends EnemyStateBase

func enter(_previous_state_path: String, data := {}) -> void:
	swiper_instance._swiper_sprites.animation = "attack"
	await get_tree().create_timer(0.25).timeout
	data.target.take_damage(1)
	finished.emit(IDLE)
