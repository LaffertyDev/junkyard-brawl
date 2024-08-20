extends EnemyStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	swiper_instance._swiper_sprites.play("idle")
	await get_tree().create_timer(0.1).timeout
	finished.emit(FIND_TARGET)

func update(_delta: float) -> void:
	if swiper_instance.current_health <= 0:
		finished.emit(DIE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "TakeDamage":
		finished.emit(TAKE_DAMAGE)
