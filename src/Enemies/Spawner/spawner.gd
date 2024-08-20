extends Area2D

var swiper_scene = preload("res://src/Enemies/Swiper/swiper.tscn")

var game_scene: GameScene

var current_health = 3

func _ready() -> void:
	await owner.ready
	game_scene = owner as GameScene
	assert(game_scene != null, "The Spawner node must be used only in the root Game scene. It needs the owner to be a Game Scene node.")


func take_damage(_damage: int) -> void:
	current_health -= 1
	%animation.play("die")

func _on_activate_radius_body_entered(_body: Node2D) -> void:
	print("Activated")
	%animation.play("spawn")


func _on_activate_radius_area_shape_entered(_area_rid: RID, _area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("Activated")
	%animation.play("spawn")


func _on_sprite_2d_animation_finished() -> void:
	if %animation.animation == "die":
		if current_health <= 0:
			queue_free()
		else:
			%animation.play("spawn")


func _on_sprite_2d_animation_looped() -> void:
	if %animation.animation == "spawn":
		var instance = swiper_scene.instantiate()
		instance.position = self.position
		game_scene.add_child(instance)
