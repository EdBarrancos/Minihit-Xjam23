extends Node3D

const mainmenu = preload("res://Game/Scenes/main_menu.tscn")
const level = preload("res://Store/Scenes/store.tscn")
const end_screen = preload("res://Game/Scenes/end_screen.tscn")

@onready var current_scene = $"Main Menu"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("EXIT"):
		get_tree().quit()


func loadGame():
	Global.score = 0
	current_scene.queue_free()
	current_scene = level.instantiate()
	add_child(current_scene)
	
func load_end_screen():
	current_scene.queue_free()
	current_scene = end_screen.instantiate()
	add_child(current_scene)
