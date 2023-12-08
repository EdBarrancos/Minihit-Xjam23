extends Node3D

class_name Bullet

@export var raycast : RayCast3D

signal hit

func _process(delta):
	if raycast.get_collider():
		raycast.get_collider().hit()
		emit_signal("hit")
