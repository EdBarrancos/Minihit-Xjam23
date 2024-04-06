extends Control

@onready var points = $VBoxContainer/Points

# Called when the node enters the scene tree for the first time.
func _ready():
	points.text = str(Global.score)
	Global._reset_variables()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/main_menu.tscn")


func _on_next_shift_pressed():
	match Global.current_scene:
		"1":
			Global.current_scene = "2"
			get_tree().change_scene_to_file("res://Store/Scenes/store2.tscn")
		"2":
			Global.current_scene = "3"
			get_tree().change_scene_to_file("res://Store/Scenes/store3.tscn")
		"3":
			Global.current_scene = "4"
			get_tree().change_scene_to_file("res://Store/Scenes/store4.tscn")
		"4":
			Global.current_scene = "5"
			get_tree().change_scene_to_file("res://Store/Scenes/store5.tscn")
		_:
			get_tree().change_scene_to_file("res://Game/Scenes/main_menu.tscn")
