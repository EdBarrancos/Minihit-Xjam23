extends Node3D

@export var raycast : RayCast3D

signal hit

func _process(delta):
	if raycast.get_collider():
		raycast.get_collider().hit()
		emit_signal("hit")
