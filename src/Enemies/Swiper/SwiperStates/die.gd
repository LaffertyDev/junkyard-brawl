extends EnemyStateBase

var angle_to_move: float
var death_velocity: float = 150

func enter(_previous_state_path: String, _data := {}) -> void:
	swiper_instance._swiper_sprites.play("die")
	swiper_instance._swiper_sprites.animation_finished.connect(on_animation_die_complete, CONNECT_ONE_SHOT)

	# add a force in the direction of Max and whatever killed me
	var max_player = get_tree().get_nodes_in_group("max")[0]
	# get direction to max
	angle_to_move = swiper_instance.position.angle_to_point(max_player.position)

func physics_update(delta: float) -> void:
	swiper_instance.position -= Vector2(death_velocity, 0).rotated(angle_to_move) * delta
	death_velocity = death_velocity * (1.0 - delta * 4.0)

func on_animation_die_complete() -> void:
	swiper_instance.spawn_pickup()
	swiper_instance.queue_free()
