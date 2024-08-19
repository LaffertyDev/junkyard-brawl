extends HammerStateBase

var anim_tween: Tween

func enter(_previous_state_path: String, _data := {}) -> void:
	print("Unpowered")

func update(delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		finished.emit(HAMMER_IDLE)
