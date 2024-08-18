extends MechMovementState

var anim_tween: Tween

func enter(_previous_state_path: String, _data := {}) -> void:
	if anim_tween:
		anim_tween.kill()
	anim_tween = get_tree().create_tween()
	anim_tween.set_parallel(true)
	anim_tween.tween_property(max_player._leg_bottom_left, "position", Vector2(-28, 28), 0.25)
	anim_tween.tween_property(max_player._leg_top_right, "position", Vector2(28, -28), 0.25)
	anim_tween.finished.connect(handle_animation_complete)

func physics_update(_delta: float):
	if Input.is_action_just_pressed("move_forward") \
	 or Input.is_action_just_pressed("move_backward") \
	 or Input.is_action_just_pressed("move_left") \
	 or Input.is_action_just_pressed("move_right"):
		finished.emit(MOVE_WINDUP)

func handle_animation_complete():
	finished.emit(MOVE_IDLE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(MOVE_DIE)

func exit():
	anim_tween.kill()
