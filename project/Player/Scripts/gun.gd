extends Node3D

@export var ammo_type_scene : PackedScene
@onready var gun_barrel = $RayCast3D
@onready var slingshot = $Slingshot3
@onready var stretch_sound = $Stretch
@onready var sling_sound = $Sling

var loaded_bullet

enum MODE {CHARGING, SHOOTING, NOTHING}

@onready var mode = MODE.NOTHING

# Called when the node enters the scene tree for the first time.
func _ready():
	create_bullet()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()

func handle_input():
	if Input.is_action_pressed("SHOOT") && mode == MODE.NOTHING && Global.current_ammo > 0:
		handle_charging_shoot()
	elif Input.is_action_just_released("SHOOT") && mode == MODE.CHARGING:
		handle_shooting()
	elif Input.is_action_just_pressed("INTERACT") && Global.can_reload == true:
		handle_reload()

func handle_charging_shoot():
	slingshot.charge()
	mode = MODE.CHARGING
	stretch_sound.play()
	
func handle_shooting():
	var charging = slingshot.shoot()
	shoot(charging)
	mode = MODE.SHOOTING
	stretch_sound.stop()
	sling_sound.play()
	
func handle_reload():
	Global.current_ammo = 10
	
func shoot(charging):
	Global._gun_shot()
	if !is_instance_valid(loaded_bullet):
		create_bullet()
	loaded_bullet.shoot(charging)
	loaded_bullet.transform.basis = gun_barrel.global_transform.basis
	
func create_bullet():
	loaded_bullet = ammo_type_scene.instantiate()
	loaded_bullet.marker_loaded = slingshot.marker_3d
	get_viewport().call_deferred("add_child", loaded_bullet)
	
func _on_slingshot_3_shoot_animation_ended():
	mode = MODE.NOTHING
	create_bullet()
