extends Control

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Store/Scenes/store2.tscn")
