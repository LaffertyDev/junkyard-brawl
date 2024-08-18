extends EnemyStateBase

var target: Node2D

func enter(_previous_state_path: String, data := {}) -> void:
	target = data.target

func physics_update(delta: float) -> void:
	# rotate the sprite to always face target
	var angle_to = swiper_instance.position.angle_to_point(target.position)
	var octant = int(round( 8 * angle_to / (2*PI) + 8 )) % 8;
	swiper_instance._swiper_sprites.rotation = octant * PI / 4 - PI / 2
	
	const velocity = 25
	const reach = 75
	
	# are we there does our weapon reach?
	# TODO - add an attack windup
	var distance_to = swiper_instance.position.distance_to(target.position)
	if distance_to < reach:
		finished.emit(ATTACK, { "target": target })
	
	# move closer.
	var direction_to = swiper_instance.position.direction_to(target.position)
	swiper_instance.position += direction_to * velocity * delta
