extends FreekState

func enter(_previous_state_path: String, _data := {}) -> void:
	freek_player.hide()

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(IDLE)

func exit():
	freek_player.show()
