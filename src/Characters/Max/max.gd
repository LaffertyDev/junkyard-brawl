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
@warning_ignore("unused_private_class_variable")
@onready var _hammer: AnimatedSprite2D = %max_hammer
@warning_ignore("unused_private_class_variable")
@onready var _hammer_sound: AudioStreamPlayer = %hammer_sound
@onready var _rotation_sound: AudioStreamPlayer = %audio_torso_rotate
@warning_ignore("unused_private_class_variable")
@onready var _hammer_attack_damage_scan_area: Area2D = %AttackDamageScanArea

# screen shake from https://www.youtube.com/watch?v=LGt-jjVf-ZU
var rng = RandomNumberGenerator.new()
var shake_strength = 0.0
var shake_fade = 7.5

func _ready() -> void:
	add_to_group("max")

func get_shake_random_offset():
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

func _physics_process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		_max_camera.offset = get_shake_random_offset()
	else:
		_max_camera.offset = Vector2(0, 0)
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		var target_angle = get_global_mouse_position().angle_to_point(self.position) - (PI / 2)
		var remaining_angle = int(abs(rad_to_deg(target_angle - _torso.rotation))) % 360
		if remaining_angle > 45:
			start_rotating()
		else:
			stop_rotating()
		_torso.rotation = lerp_angle(_torso.rotation, target_angle, 1.25 * delta)
	else:
		stop_rotating()

func take_damage(damage: int) -> void:
	PlayerState.max_current_health -= damage
	if PlayerState.max_current_health <= 0:
		%MovementState.send_message_to_state("Die")

# TODO - This breaks my brain a bit. Audio processing seems a little buggy.
var audio_tween: Tween
func start_rotating() -> void:
	if audio_tween:
		audio_tween.kill()
		audio_tween = null
	_rotation_sound.volume_db = -10
	if not _rotation_sound.playing:
		_rotation_sound.play()

func stop_rotating() -> void:
	if _rotation_sound.playing:
		if not audio_tween or not audio_tween.is_valid():
			audio_tween = get_tree().create_tween()
			audio_tween.tween_property(_rotation_sound, "volume_db", -40, 0.25)
			audio_tween.tween_callback(_rotation_sound.stop)
