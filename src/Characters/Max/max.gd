class_name Max extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
@onready var _leg_bottom_left: Node2D = %leg_bottom_left
@warning_ignore("unused_private_class_variable")
@onready var _leg_bottom_right: Node2D = %leg_bottom_right
@warning_ignore("unused_private_class_variable")
@onready var _leg_top_left: Node2D = %leg_top_left
@warning_ignore("unused_private_class_variable")
@onready var _leg_top_right: Node2D = %leg_top_right
@onready var _torso: Node2D = %max_torso
@onready var _hammer: AnimatedSprite2D = %max_hammer

func _physics_process(delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Boarded:
		var target_angle = get_global_mouse_position().angle_to_point(self.position) - (PI / 2)

		_torso.rotation = lerp_angle(_torso.rotation, target_angle, 1.0 * delta)

		if Input.is_action_pressed("action_primary"):
			_hammer.animation = "engage"
		else:
			_hammer.animation = "idle"
