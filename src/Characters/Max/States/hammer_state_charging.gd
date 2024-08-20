extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	max_player._hammer.play("windup")
	max_player._hammer.animation_finished.connect(on_windup_finished, CONNECT_ONE_SHOT)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_COOLDOWN)

	if not Input.is_action_pressed("action_primary"):
		finished.emit(HAMMER_COOLDOWN)

func on_windup_finished() -> void:
	finished.emit(HAMMER_ACTUATING)
	
