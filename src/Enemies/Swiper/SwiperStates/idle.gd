extends EnemyStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	swiper_instance._swiper_sprites.play("idle")
	swiper_instance._swiper_sprites.animation_looped.connect(on_animation_idle_complete, CONNECT_ONE_SHOT)

func update(_delta: float) -> void:
	if swiper_instance.current_health <= 0:
		finished.emit(DIE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "TakeDamage":
		finished.emit(TAKE_DAMAGE)

func on_animation_idle_complete() -> void:
	finished.emit(FIND_TARGET)
