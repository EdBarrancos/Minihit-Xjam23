extends Node3D

@export var door: Area3D

@onready var timer = 0.0
@onready var interval = 5.0

@export var child_scene : PackedScene  #load("res://Child/Scenes/child.tscn")
@onready var child_number  = 1

@export var gameboy_scene : PackedScene #load("res://Store/Scenes/gameboy.tscn")
@onready var gameboy_number  = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= interval:
		child_number += 1
		gameboy_number += 1
		
		var child_instance = child_scene.instantiate()
		
		child_instance.set_name("Child" + str(child_number))
		
		add_child(child_instance)
		
		child_instance.position = Vector3(-5.689, 0.931, 5.599)
		child_instance.door = door
		child_instance.gameboy = _instantiate_gameboy()
		
		timer = 0.0
		
		
func _instantiate_gameboy():
	var gameboy_instance = gameboy_scene.instantiate()
	#TODO: Create a gameboy in random position
	gameboy_instance.position = Vector3(-0.976, 0.58, -12.866)
	gameboy_instance.set_name("Gameboy" + str(gameboy_number))
	add_child(gameboy_instance)
	return gameboy_instance
