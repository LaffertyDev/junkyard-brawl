extends MechMovementState

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO - play animation
	max_player._max_camera.enabled = false
	pass
	
func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		finished.emit(MOVE_IDLE)

func exit() -> void:
	max_player._max_camera.enabled = true
