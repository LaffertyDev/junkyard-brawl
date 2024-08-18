extends Control

func _ready() -> void:
	%ExitGame.visible = OS.get_name() != "Web"
	
func _on_play_again_pressed() -> void:
	SceneManager.change_scene_to_game()

func _on_rate_my_game_pressed() -> void:
	SceneManager.load_gamejam_rating_portal()

func _on_exit_game_pressed() -> void:
	get_tree().quit()
