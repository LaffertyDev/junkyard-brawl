extends MechMovementState

var anim_tween: Tween

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO - play death animation, spawn freek if he is piloted
	PlayerState.is_freek_near_max = false
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		PlayerState.SetPilotState(Enums.PilotState.Ejected)

	await get_tree().create_timer(0.5).timeout
	max_player.queue_free()
