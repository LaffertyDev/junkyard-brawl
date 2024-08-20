extends MechMovementState

var anim_tween: Tween
var start_position: Vector2
var target_position: Vector2

func enter(_previous_state_path: String, data := {}) -> void:
	anim_tween = get_tree().create_tween()
	anim_tween.set_parallel(true)
	anim_tween.tween_property(max_player._leg_bottom_left, "position", Vector2(-28, 28), LEG_ANIMATION_DURATION)
	anim_tween.tween_property(max_player._leg_top_right, "position", Vector2(28, -28), LEG_ANIMATION_DURATION)
	anim_tween.finished.connect(handle_animation_complete)
	
	var distance_to_move = data.movement_direction.normalized() * LEG_MOVEMENT_SPEED
	
	start_position = max_player.position
	target_position = start_position + distance_to_move
	max_player.velocity = distance_to_move / LEG_ANIMATION_DURATION # move that speed but in 0.5 seconds

func physics_update(_delta: float):
	max_player.move_and_slide()

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(MOVE_DIE)

func handle_animation_complete():
	finished.emit(MOVE_IDLE)

func exit():
	max_player.velocity.x = 0
	max_player.velocity.y = 0
	anim_tween.kill()
