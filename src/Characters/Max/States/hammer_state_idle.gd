extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	print("Idle")
	pass

func update(delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_UNPOWERED)

	if Input.is_action_pressed("action_primary"):
		finished.emit(HAMMER_CHARGING)
		pass
