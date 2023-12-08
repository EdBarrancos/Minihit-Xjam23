extends Node3D

@export var ammo_type_scene : PackedScene
@onready var gun_barrel = $RayCast3D
@onready var slingshot = $Slingshot

var charging_tween

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()

func handle_input():
	if Input.is_action_just_pressed("SHOOT"):
		handle_charging_shoot()
	elif Input.is_action_just_released("SHOOT"):
		handle_shooting()

func handle_charging_shoot():
	charging_tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	charging_tween.tween_property(self, "scale", Vector3(1, 1, 1.5), 0.5)
	
func handle_shooting():
	if charging_tween != null:
		charging_tween.kill()
	self.scale = Vector3(1, 1, 1)
	shoot()
	
func shoot():
	var bullet_instance = ammo_type_scene.instantiate()
	bullet_instance.position = gun_barrel.global_position
	bullet_instance.transform.basis = gun_barrel.global_transform.basis
	get_viewport().add_child(bullet_instance)
	
