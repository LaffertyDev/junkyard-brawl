extends Node

var current_pilot_state = Enums.PilotState.Boarded

func SetPilotState(state_to_be: Enums.PilotState) -> void:
	current_pilot_state = state_to_be
	pass
