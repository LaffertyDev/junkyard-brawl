extends MechMovementState

var anim_tween: Tween
var movement_direction: Vector2

func enter(_previous_state_path: String, _data := {}) -> void:
	movement_direction = Vector2(0, 0)
	
	await get_tree().create_timer(0.05).timeout
	
	var input_direction_x := Input.get_axis("move_left", "move_right")
	var input_direction_y := Input.get_axis("move_forward", "move_backward")
	
	movement_direction = Vector2(input_direction_x, input_direction_y)
	var distance = movement_direction.normalized() * LEG_MOVEMENT_SPEED
	
	update_animation(LEG_ANIMATION_DURATION, distance)

func physics_update(_delta: float):
	if not Input.is_action_pressed("move_forward") \
	 and not Input.is_action_pressed("move_backward") \
	 and not Input.is_action_pressed("move_left") \
	 and not Input.is_action_pressed("move_right"):
		finished.emit(MOVE_CANCEL)
		
func update_animation(duration: float, distance_to_move: Vector2) -> void:
	if anim_tween:
		anim_tween.kill()
	anim_tween = get_tree().create_tween()
	anim_tween.set_parallel(true)
	anim_tween.tween_property(max_player._leg_bottom_left, "position", max_player._leg_bottom_left.position + distance_to_move, duration).from_current()
	anim_tween.tween_property(max_player._leg_top_right, "position", max_player._leg_top_right.position + distance_to_move, duration).from_current()
	anim_tween.finished.connect(handle_animation_complete)

func handle_animation_complete():
	finished.emit(MOVE_COMMIT, { "movement_direction": movement_direction })

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(MOVE_DIE)

func exit():
	if anim_tween:
		anim_tween.kill()
