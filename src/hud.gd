extends Control

@onready var _eject_button: Button = %ButtonEject

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_eject_pressed() -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		_eject_button.text = "Eject"
		PlayerState.SetPilotState(Enums.PilotState.BoardRequested)
	elif PlayerState.current_pilot_state == Enums.PilotState.Boarded:
		_eject_button.text = "Pilot"
		PlayerState.SetPilotState(Enums.PilotState.EjectRequested)
		
