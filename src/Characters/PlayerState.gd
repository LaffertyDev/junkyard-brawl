extends Node

var current_pilot_state = Enums.PilotState.Piloting

var is_freek_near_max: bool = false

func SetPilotState(state_to_be: Enums.PilotState) -> void:
	current_pilot_state = state_to_be
	pass
