extends Node3D

@export var doors: Array[Area3D] 
@export var gameboySpawnPoints: Array[Marker3D]

@onready var timer = 0.0
@onready var interval = 3.0

@onready var child_scene =  preload("res://Child/Scenes/child.tscn")
@onready var child_number  = 0
@onready var max_child = 3

@export var gameboy_scene : PackedScene 
@onready var gameboy_number  = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= interval and Global.current_child < max_child:
		child_number += 1
		gameboy_number += 1
		
		var child_instance = child_scene.instantiate()
		
		child_instance.set_name("Child" + str(child_number))
		
		add_child(child_instance)
		
		var door = doors[randi() % doors.size()]
		
		child_instance.position = door.position + Vector3(0, 0, 1.2)
		child_instance._set_door(door)
		
		child_instance._set_gameboy(_instantiate_gameboy()) 
		
		Global._child_spawned()
		timer = 0.0
		
		
func _instantiate_gameboy():
	var gameboy_instance = gameboy_scene.instantiate()
	#TODO: Create a gameboy in random position
	gameboy_instance.position = gameboySpawnPoints[randi() % gameboySpawnPoints.size()].position
	gameboy_instance.set_name("Gameboy" + str(gameboy_number))
	add_child(gameboy_instance)
	return gameboy_instance
