extends Node

var current_pilot_state: Enums.PilotState

var is_freek_near_max: bool

var freek_current_health: int
var freek_maximum_health: int

var max_current_health: int
var max_maximum_health: int

func Initialize() -> void:
	max_current_health = 100
	max_maximum_health = 100
	freek_current_health = 100
	freek_maximum_health = 100
	is_freek_near_max = false
	current_pilot_state = Enums.PilotState.Ejected

func SetPilotState(state_to_be: Enums.PilotState) -> void:
	current_pilot_state = state_to_be
	pass
