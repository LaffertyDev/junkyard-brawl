extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	max_player._hammer.play("idle")

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		finished.emit(HAMMER_IDLE)
