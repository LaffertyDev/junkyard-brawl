extends FreekState

func enter(_previous_state_path: String, _data := {}) -> void:
	freek_player.hide()
	freek_player._freek_camera.enabled = false
	freek_player._collision_body.disabled = true

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(IDLE)

func handle_receive_message(message: String, _data: Dictionary = {}) -> void:
	if message == "Die":
		finished.emit(DIE)
		
func exit():
	freek_player.show()
	var max_node = get_tree().get_nodes_in_group("max")[0]
	freek_player.position = max_node.position
	freek_player.position.y += 60
