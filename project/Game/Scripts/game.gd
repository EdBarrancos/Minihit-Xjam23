extends Node3D

@onready var mainmenu = preload("res://Game/Scenes/main_menu.tscn")
@onready var level = preload("res://Store/Scenes/store.tscn")

@onready var current_scene = $"Main Menu"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("EXIT"):
		get_tree().quit()


func loadGame():
	current_scene.queue_free()
	current_scene = level.instantiate()
	add_child(current_scene)
