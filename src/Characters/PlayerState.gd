extends Node

var current_pilot_state = Enums.PilotState.Piloting

var is_freek_near_max: bool = false

var freek_current_health: int = 100
var freek_maximum_health: int = 100

var max_current_health: int = 100
var max_maximum_health: int = 100

func SetPilotState(state_to_be: Enums.PilotState) -> void:
	current_pilot_state = state_to_be
	pass
