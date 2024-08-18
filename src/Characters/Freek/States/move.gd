extends FreekState

const rotations = [ \
	[5 * PI / 4, PI, 3 * PI / 4], \
	[3 * PI / 2, 0, PI / 2], \
	[7 * PI / 4, 0, PI / 4] \
]

func enter(_previous_state_path: String, _data := {}) -> void:
	freek_player._freek_sprites.animation = "move"

func physics_update(_delta: float) -> void:
	if (not Input.is_action_pressed("move_forward") \
	 and not Input.is_action_pressed("move_backward") \
	 and not Input.is_action_pressed("move_left") \
	 and not Input.is_action_pressed("move_right")):
		finished.emit(IDLE)
		
	var input_direction_x := Input.get_axis("move_left", "move_right")
	var input_direction_y := Input.get_axis("move_forward", "move_backward")

	var speed = Vector2(input_direction_x, input_direction_y).normalized() * FREEK_MOVE_SPEED
	freek_player.velocity = speed
	freek_player.move_and_slide()
	freek_player._freek_sprites.rotation = rotations[input_direction_x + 1][input_direction_y + 1] + PI / 2
