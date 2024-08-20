extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	max_player._hammer.play("cooldown")
	max_player._hammer.animation_finished.connect(on_cooldown_finished, CONNECT_ONE_SHOT)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_UNPOWERED)

func on_cooldown_finished() -> void:
	finished.emit(HAMMER_IDLE)
	
