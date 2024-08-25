extends Node2D

@onready var _gun: AnimatedSprite2D = %gun
@onready var _bullet: AnimatedSprite2D = %bullet_anim
@onready var _attack_range: Area2D = %attack_range
@onready var _attack_ray: Area2D = %attack_ray
@onready var _torso: AnimatedSprite2D = %torso

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var target_angle = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_torso.rotation = lerp_angle(_torso.rotation, target_angle, 2.75 * delta)
	var enemies = _attack_range.get_overlapping_bodies()
	if enemies.size() > 0:
		var target = enemies[0]
		target_angle = target.position.angle_to_point(self.position) - (PI / 2)

func take_damage(damage: int) -> void:
	PlayerState.junkyard_king_health -= damage
	_torso.play("take_damage")

func _on_gun_animation_finished() -> void:
	if _gun.animation == "attack_windup":
		var enemies = _attack_range.get_overlapping_bodies()
		if enemies.size() > 0:
			_gun.play("attack")
		else:
			_gun.play("idle")
	elif _gun.animation == "attack":
		_bullet.play("hit")
		%gun_sound.play()
		var attack_ray_enemies = _attack_ray.get_overlapping_bodies()
		for rayenemy in attack_ray_enemies:
			rayenemy.take_damage(1)
		_gun.play("idle")

func _on_bullet_anim_animation_finished() -> void:
	_bullet.play("default")

func _on_gun_animation_looped() -> void:
	var enemies = _attack_range.get_overlapping_bodies()
	if enemies.size() > 0:
		_gun.play("attack_windup")


func _on_torso_animation_finished() -> void:
	if (PlayerState.junkyard_king_health <= 0):
		SceneManager.change_scene_to_defeat()
	_torso.play("default")
