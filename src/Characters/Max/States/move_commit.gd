extends MechMovementState

var anim_tween: Tween
var start_position: Vector2
var target_position: Vector2

func enter(_previous_state_path: String, data := {}) -> void:
	anim_tween = get_tree().create_tween()
	anim_tween.set_parallel(true)
	anim_tween.tween_property(max_player._leg_bottom_left, "position", Vector2(-28, 28), 1)
	anim_tween.tween_property(max_player._leg_top_right, "position", Vector2(28, -28), 1)

	var distance_to_move = data.movement_direction * LEG_MOVEMENT_SPEED
	
	if distance_to_move.abs().length() > (LEG_MOVEMENT_SPEED + 1):
		distance_to_move = distance_to_move * 0.65
		
	start_position = max_player.position
	target_position = start_position + distance_to_move
	max_player.velocity = distance_to_move

func physics_update(_delta: float):
	max_player.move_and_slide()
	
	if abs(max_player.position.distance_to(target_position)) < 1:
		max_player.velocity.x = 0
		max_player.velocity.y = 0
		finished.emit(MOVE_IDLE)

func exit():
	anim_tween.kill()
