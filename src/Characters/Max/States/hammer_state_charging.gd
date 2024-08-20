extends HammerStateBase

var was_cancelled = false
func enter(_previous_state_path: String, _data := {}) -> void:
	was_cancelled = false
	max_player._hammer.play("windup")
	max_player._hammer.animation_finished.connect(on_windup_finished, CONNECT_ONE_SHOT)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_COOLDOWN)
		was_cancelled = true

	if not Input.is_action_pressed("action_primary"):
		finished.emit(HAMMER_COOLDOWN)
		was_cancelled = true

func on_windup_finished() -> void:
	if not was_cancelled:
		finished.emit(HAMMER_ACTUATING)
	
