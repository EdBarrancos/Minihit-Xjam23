extends Node3D

@export var doors: Array[Area3D] 
@export var gameboySpawnPoints: Array[Marker3D]

@onready var timer = 0.0
@onready var interval = 2.3

@export var child_scene : PackedScene  
@onready var child_number  = 0
@onready var max_child = 3

@export var gameboy_scene : PackedScene 
@onready var gameboy_number  = 0

@onready var gameboys = []

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_gameboys()
	
func spawn_gameboys():
	for i in gameboySpawnPoints:
		gameboys.push_back(_instantiate_gameboy(i))

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
		
		var gameboy = gameboys[randi() % gameboys.size()]
		child_instance._set_gameboy(gameboy) 
		
		Global._child_spawned()
		timer = 0.0
		
func _instantiate_gameboy(gameboy_position):
	var gameboy_instance = gameboy_scene.instantiate()
	#TODO: Create a gameboy in random position
	gameboy_instance.position = gameboy_position.position
	gameboy_instance.set_name("Gameboy" + str(gameboy_number))
	add_child(gameboy_instance)
	return gameboy_instance
