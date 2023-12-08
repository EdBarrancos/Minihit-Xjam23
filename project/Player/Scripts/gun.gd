extends Node3D

@export var ammo_type_scene : PackedScene
@onready var gun_barrel = $RayCast3D
@onready var slingshot = $Slingshot3

var loaded_bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	create_bullet()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()

func handle_input():
	if Input.is_action_just_pressed("SHOOT"):
		handle_charging_shoot()
	elif Input.is_action_just_released("SHOOT"):
		handle_shooting()

func handle_charging_shoot():
	slingshot.charge()
	
func handle_shooting():
	shoot()
	slingshot.shoot()
	
func shoot():
	loaded_bullet.shoot()
	loaded_bullet.transform.basis = gun_barrel.global_transform.basis
	
	
func create_bullet():
	loaded_bullet = ammo_type_scene.instantiate()
	loaded_bullet.marker_loaded = slingshot.marker_3d
	get_viewport().call_deferred("add_child", loaded_bullet)
	
func _on_slingshot_3_shoot_animation_ended():
	print("Hello")
	create_bullet()
