class_name Freek extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
@onready var _freek_sprites: AnimatedSprite2D = %freek_sprites

@warning_ignore("unused_private_class_variable")
@onready var _freek_camera: Camera2D = %FreekCamera

func _ready() -> void:
	add_to_group("freek")

func take_damage(damage: int) -> void:
	PlayerState.freek_current_health -= damage
	if PlayerState.freek_current_health <= 0:
		print("Game Over! TODO: Die!")
