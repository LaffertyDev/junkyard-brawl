extends FreekState

func enter(_previous_state_path: String, _data := {}) -> void:
	freek_player._freek_sprites.animation = "idle"
	freek_player._freek_camera.enabled = true
	freek_player._collision_body.disabled = false

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Piloting:
		finished.emit(PILOTING)
		
func physics_update(_delta: float) -> void:
	if (Input.is_action_pressed("move_forward") \
	 or Input.is_action_pressed("move_backward") \
	 or Input.is_action_pressed("move_left") \
	 or Input.is_action_pressed("move_right")):
		finished.emit(MOVE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(DIE)
