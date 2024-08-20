extends Node

var current_pilot_state: Enums.PilotState

var is_freek_near_max: bool

var freek_current_health: int
var freek_maximum_health: int

var max_current_health: int
var max_maximum_health: int

var junkyard_king_health: int
var junkyard_king_max_health: int

var freek_hold_status: Enums.FreekItemHeld

var mechs_destroyed: int

func Initialize() -> void:
	max_current_health = 0
	max_maximum_health = 10
	freek_current_health = 3
	freek_maximum_health = 3
	is_freek_near_max = false
	current_pilot_state = Enums.PilotState.Ejected
	freek_hold_status = Enums.FreekItemHeld.Nothing
	mechs_destroyed = 0
	junkyard_king_health = 5
	junkyard_king_max_health = 5

func SetPilotState(state_to_be: Enums.PilotState) -> void:
	current_pilot_state = state_to_be
	pass
