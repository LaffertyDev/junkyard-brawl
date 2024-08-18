extends MechMovementState

var anim_tween: Tween

func enter(_previous_state_path: String, _data := {}) -> void:
	if anim_tween:
		anim_tween.kill()
	anim_tween = get_tree().create_tween()
	anim_tween.set_parallel(true)
	anim_tween.tween_property(max_player._leg_bottom_left, "position", Vector2(-28, 28), 1).from_current()
	anim_tween.tween_property(max_player._leg_top_right, "position", Vector2(28, -28), 1).from_current()

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(MOVE_UNPOWERED)

func physics_update(_delta: float) -> void:
	if (Input.is_action_pressed("move_forward") \
	 or Input.is_action_pressed("move_backward") \
	 or Input.is_action_pressed("move_left") \
	 or Input.is_action_pressed("move_right")):
		finished.emit(MOVE_WINDUP)

func exit():
	anim_tween.kill()
