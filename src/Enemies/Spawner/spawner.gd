extends Node2D

var swiper_scene = preload("res://src/Enemies/Swiper/swiper.tscn")

var game_scene: GameScene

func _ready() -> void:
	await owner.ready
	game_scene = owner as GameScene
	assert(game_scene != null, "The Spawner node must be used only in the root Game scene. It needs the owner to be a Game Scene node.")
	
func _on_spawn_timer_timeout() -> void:
	var instance = swiper_scene.instantiate()
	instance.position = self.position
	game_scene.add_child(instance)
