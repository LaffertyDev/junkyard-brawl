class_name Swiper extends Area2D

@warning_ignore("unused_private_class_variable")
@onready var _enemy_finder: Area2D = %EnemyFinder

@warning_ignore("unused_private_class_variable")
@onready var _swiper_sprites: AnimatedSprite2D = $AnimatedSprite2D

var current_health = 1
var maximum_health = 1

func take_damage(damage: int) -> void:
	current_health -= damage
