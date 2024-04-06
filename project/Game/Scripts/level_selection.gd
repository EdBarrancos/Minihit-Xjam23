extends Control

func _on_level_1_pressed():
	Global.current_scene = "1"
	get_tree().change_scene_to_file("res://Store/Scenes/store.tscn")
	
func _on_level_2_pressed():
	Global.current_scene = "2"
	get_tree().change_scene_to_file("res://Store/Scenes/store2.tscn")

func _on_level_3_pressed():
	Global.current_scene = "3"
	get_tree().change_scene_to_file("res://Store/Scenes/store3.tscn")

func _on_level_4_pressed():
	Global.current_scene = "4"
	get_tree().change_scene_to_file("res://Store/Scenes/store4.tscn")

func _on_level_5_pressed():
	Global.current_scene = "5"
	get_tree().change_scene_to_file("res://Store/Scenes/store5.tscn")

func _on_back_button_pressed():
	Global.current_scene = "0"
	get_tree().change_scene_to_file("res://Game/Scenes/main_menu.tscn")

