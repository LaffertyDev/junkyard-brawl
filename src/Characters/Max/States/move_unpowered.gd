extends MechMovementState

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO - play animation
	max_player._max_camera.enabled = false
	max_player._engine_sound.stop()
	pass
	
func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		finished.emit(MOVE_IDLE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(MOVE_DIE)

func exit() -> void:
	max_player._engine_sound.play()
	max_player._max_camera.enabled = true
