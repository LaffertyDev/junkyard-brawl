extends FreekState

func enter(_previous_state_path: String, _data := {}) -> void:
	await get_tree().create_timer(1.0).timeout
	SceneManager.change_scene_to_defeat()
	
