extends MechMovementState

var anim_tween: Tween

func enter(_previous_state_path: String, _data := {}) -> void:
	max_player._max_camera.enabled = false
	max_player.set_collision_layer_value(8, false)
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		PlayerState.SetPilotState(Enums.PilotState.Ejected)

func update(_delta: float) -> void:
	if PlayerState.max_current_health > 0:
		finished.emit(MOVE_UNPOWERED)

func exit():
	max_player.set_collision_layer_value(8, true)
