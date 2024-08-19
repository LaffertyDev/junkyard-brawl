extends EnemyStateBase

var angle_to_move: float
var death_velocity: float = 150

func enter(_previous_state_path: String, _data := {}) -> void:
	# turn swiper into a rigid body
	# add a force in the direction of Max and whatever killed me
	var max_player = get_tree().get_nodes_in_group("max")[0]
	# get direction to max
	angle_to_move = swiper_instance.position.angle_to_point(max_player.position)

	await get_tree().create_timer(0.5).timeout
	swiper_instance.spawn_pickup()
	
	swiper_instance.queue_free()

func physics_update(delta: float) -> void:
	swiper_instance.position -= Vector2(death_velocity, 0).rotated(angle_to_move) * delta
	death_velocity = death_velocity * (1.0 - delta * 4.0)
