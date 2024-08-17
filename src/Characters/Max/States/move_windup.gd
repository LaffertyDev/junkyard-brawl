extends MechMovementState

var anim_tween: Tween
var movement_direction: Vector2

func enter(_previous_state_path: String, _data := {}) -> void:
	movement_direction = Vector2(0, 0)
	
	await get_tree().create_timer(0.05).timeout
	
	if Input.is_action_pressed("move_forward"):
		movement_direction.y = -1
	elif Input.is_action_pressed("move_backward"):
		movement_direction.y = 1
	if Input.is_action_pressed("move_right"):
		movement_direction.x = 1
	elif Input.is_action_pressed("move_left"):
		movement_direction.x = -1
		
	var distance = movement_direction * LEG_MOVEMENT_SPEED
	if distance.abs().length() > (LEG_MOVEMENT_SPEED + 1):
		distance = distance * 0.65
	
	update_animation(1.0, distance)

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

func exit():
	anim_tween.kill()
