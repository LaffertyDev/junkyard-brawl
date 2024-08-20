class_name HUD extends Control

@onready var _margin_container: MarginContainer = %GuiPanelMargin
@onready var _left_pillarbox: Panel = %Left_Pillarbox
@onready var _right_pillarbox: Panel = %Right_Pillarbox
@onready var _max_health: ProgressBar = %Max_Health
@onready var _freek_health: ProgressBar = %Freek_Health
@onready var _pause_panel: Panel = %pause_panel
@onready var _item_held_texture: TextureRect = %item_held_texture
@onready var _max_container: Control = %MaxContainer

@onready var _drill_repair_sound: AudioStreamPlayer = %repair_sound

@onready var _button_eject: Button = %button_eject
@onready var _button_pilot: Button = %button_pilot
@onready var _button_heal: Button = %button_heal

var ui_tween: Tween

func _ready() -> void:
	%button_exit_game.visible = OS.get_name() != "Web"

func _process(_delta: float) -> void:
	_max_health.max_value = PlayerState.max_maximum_health
	_max_health.value = PlayerState.max_current_health
	_freek_health.max_value = PlayerState.freek_maximum_health
	_freek_health.value = PlayerState.freek_current_health
	
	if Input.is_action_just_pressed("pause_game"):
		get_tree().paused = true
		_pause_panel.show()
		
	if PlayerState.freek_hold_status == Enums.FreekItemHeld.Nothing:
		_item_held_texture.hide()
	else:
		_item_held_texture.show()

	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		_button_eject.show()
		_button_pilot.hide()
		_button_heal.hide()
	else:
		if PlayerState.is_freek_near_max:
			if PlayerState.freek_hold_status == Enums.FreekItemHeld.HealthPickup \
				and PlayerState.max_current_health != PlayerState.max_maximum_health:
				_button_eject.hide()
				_button_pilot.hide()
				_button_heal.show()
			elif PlayerState.max_current_health > 0:
				_button_eject.hide()
				_button_pilot.show()
				_button_heal.hide()
			else:
				_button_eject.hide()
				_button_pilot.hide()
				_button_heal.hide()
		else:
			_button_eject.hide()
			_button_pilot.hide()
			_button_heal.hide()

func _on_button_eject_pressed() -> void:
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

func _on_unpause_pressed() -> void:
	_pause_panel.hide()
	get_tree().paused = false

func _on_button_heal_pressed() -> void:
	const repair_amount = 10
	PlayerState.max_current_health = min(PlayerState.max_maximum_health, PlayerState.max_current_health + repair_amount)
	PlayerState.freek_hold_status = Enums.FreekItemHeld.Nothing
	_drill_repair_sound.play()

func _on_button_pilot_pressed() -> void:
	PlayerState.SetPilotState(Enums.PilotState.Piloting)
	animate_scene_swap(false)
	_max_container.show()

func _on_button_rate_game_pressed() -> void:
	SceneManager.load_gamejam_rating_portal()

func _on_button_exit_game_pressed() -> void:
	get_tree().quit()
