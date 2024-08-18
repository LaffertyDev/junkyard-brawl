extends MechMovementState

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO - play animation
	# TODO - spawn Freek
	PlayerState.SetPilotState(Enums.PilotState.Ejected)
	pass
	
func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.BoardRequested:
		finished.emit(MOVE_IDLE)
		PlayerState.SetPilotState(Enums.PilotState.Boarded)
