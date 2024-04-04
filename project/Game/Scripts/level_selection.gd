extends Control

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store2.tscn")
	
func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store3.tscn")
	
func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store4.tscn")

func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store5.tscn")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/main_menu.tscn")
