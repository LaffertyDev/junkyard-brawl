class_name Max extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
@onready var _leg_bottom_left: Node2D = %leg_bottom_left
@warning_ignore("unused_private_class_variable")
@onready var _leg_bottom_right: Node2D = %leg_bottom_right
@warning_ignore("unused_private_class_variable")
@onready var _leg_top_left: Node2D = %leg_top_left
@warning_ignore("unused_private_class_variable")
@onready var _leg_top_right: Node2D = %leg_top_right
@warning_ignore("unused_private_class_variable")
@onready var _max_camera: Camera2D = %MaxCamera
@onready var _torso: Node2D = %max_torso
@onready var _hammer: AnimatedSprite2D = %max_hammer
@onready var _hammer_attack_damage_scan_area: Area2D = %AttackDamageScanArea



func _ready() -> void:
	add_to_group("max")

func _physics_process(delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		var target_angle = get_global_mouse_position().angle_to_point(self.position) - (PI / 2)

		_torso.rotation = lerp_angle(_torso.rotation, target_angle, 1.0 * delta)

		if Input.is_action_pressed("action_primary"):
			_hammer.animation = "engage"
			var areas_hit = _hammer_attack_damage_scan_area.get_overlapping_areas()
			for area in areas_hit:
				area.take_damage(1)
		else:
			_hammer.animation = "idle"

func take_damage(damage: int) -> void:
	PlayerState.max_current_health -= damage
	if PlayerState.max_current_health <= 0:
		print("Game Over! TODO: Die!")

func _on_freek_enter_radius_body_entered(_body: Node2D) -> void:
	PlayerState.is_freek_near_max = true

func _on_freek_enter_radius_body_exited(_body: Node2D) -> void:
	PlayerState.is_freek_near_max = false
