extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	print("Cooldown")
	await get_tree().create_timer(0.25).timeout
	max_player._hammer.animation = "idle"
	finished.emit(HAMMER_IDLE)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_UNPOWERED)
