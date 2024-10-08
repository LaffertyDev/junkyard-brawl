class_name Swiper extends Area2D

@warning_ignore("unused_private_class_variable")
@onready var _enemy_finder: Area2D = %EnemyFinder

@warning_ignore("unused_private_class_variable")
@onready var _attack_radius: Area2D = %attack_radius

@warning_ignore("unused_private_class_variable")
@onready var _swiper_sprites: AnimatedSprite2D = $AnimatedSprite2D

@warning_ignore("unused_private_class_variable")
@onready var _footstep_sounds: AudioStreamPlayer = %footstep_sounds

@warning_ignore("unused_private_class_variable")
@onready var _attack_sound: AudioStreamPlayer = %attack_sound

var current_health = 2
var maximum_health = 2

var health_pick_scene = preload("res://src/Pickups/health_pickup.tscn")
var game_scene: GameScene
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	if owner != null:
		await owner.ready
		game_scene = owner as GameScene
	else:
		var parent = get_parent()
		game_scene = parent as GameScene
	assert(game_scene != null, "The Swiper node must be used only in the root Game scene. It needs the owner to be a Game Scene node.")
	
func take_damage(damage: int) -> void:
	current_health -= damage
	%StateMachine.send_message_to_state("TakeDamage")

func spawn_pickup() -> void:
	if rng.randi_range(0, 100) < 33:
		var health_pick_instance = health_pick_scene.instantiate()
		health_pick_instance.position = self.position
		game_scene.add_child(health_pick_instance)
