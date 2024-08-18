extends Control

@onready var _eject_button: Button = %ButtonEject
@onready var _margin_container: MarginContainer = %GuiPanelMargin
@onready var _left_pillarbox: Panel = %Left_Pillarbox
@onready var _right_pillarbox: Panel = %Right_Pillarbox

var ui_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_eject_pressed() -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		_eject_button.text = "Eject"
		PlayerState.SetPilotState(Enums.PilotState.Piloting)
		animate_scene_swap(false)
		

	elif PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		_eject_button.text = "Pilot"
		PlayerState.SetPilotState(Enums.PilotState.Ejected)
		animate_scene_swap(true)
		

func animate_scene_swap(show_ui: bool) -> void:
	if ui_tween:
		ui_tween.kill()
	
	ui_tween = get_tree().create_tween()
	ui_tween.set_parallel(true)
	if show_ui:
		ui_tween.tween_method(set_margin_left, 20, 120, 0.1)
		ui_tween.tween_method(set_margin_right, 20, 120, 0.1)
		ui_tween.tween_property(_left_pillarbox, "size:x", 100, 0.1)
		ui_tween.tween_property(_right_pillarbox, "size:x", 100, 0.1)
	else:
		ui_tween.tween_method(set_margin_left, 120, 20, 0.2)
		ui_tween.tween_method(set_margin_right, 120, 20, 0.2)
		ui_tween.tween_property(_left_pillarbox, "size:x", 0, 0.1)
		ui_tween.tween_property(_right_pillarbox, "size:x", 0, 0.1)

func set_margin_left(val):
	_margin_container.add_theme_constant_override("margin_left", val)

func set_margin_right(val):
	_margin_container.add_theme_constant_override("margin_right", val)
