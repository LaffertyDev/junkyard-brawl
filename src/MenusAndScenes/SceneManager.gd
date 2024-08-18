extends Node

var scene_game = preload("res://src/game.tscn")
#var scene_credits = preload("res://src/screen_ui_credits/screen_ui_credits.tscn")
#var scene_tutorial = preload("res://src/screen_ui_tutorial/screen_ui_tutorial.tscn")
#var screen_main_menu = preload("res://src/screen_ui_start/screen_ui_start.tscn")
#var screen_victory = preload("res://src/screen_ui_victory/screen_ui_victory.tscn")
var screen_defeat = preload("res://src/MenusAndScenes/screen_ui_defeat.tscn")

func change_scene_to_game():
	get_tree().call_deferred("change_scene_to_packed", scene_game)

func change_scene_to_defeat():
	get_tree().call_deferred("change_scene_to_packed", screen_defeat)

func load_gamejam_rating_portal():
	if OS.get_name() == "Web":
		JavaScriptBridge.eval("window.open('https://itch.io/jam/gmtk-2023/rate/2151378', '_blank').focus();")
	else:
		OS.shell_open("https://itch.io/jam/gmtk-2023/rate/2151378")
