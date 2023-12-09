extends Node3D

class_name Bullet

signal hit

var active = false

func _on_area_entered(area):
	if active:
		area.hit()
		emit_signal("hit")
