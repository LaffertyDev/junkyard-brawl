extends EnemyStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	swiper_instance._swiper_sprites.animation = "idle"
	await get_tree().create_timer(1.0).timeout
	finished.emit(FIND_TARGET)
