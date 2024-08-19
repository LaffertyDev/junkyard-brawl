extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	print("Charging. Play an animation and a windup sound")
	
	await get_tree().create_timer(0.75).timeout
	if Input.is_action_pressed("action_primary"): # check again
		finished.emit(HAMMER_ACTUATING)
	else:
		finished.emit(HAMMER_COOLDOWN)
		

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_COOLDOWN)

	if not Input.is_action_pressed("action_primary"):
		finished.emit(HAMMER_COOLDOWN)
