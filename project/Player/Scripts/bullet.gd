extends Node3D

class_name Bullet

signal hit

func _on_area_entered(area):
	area.hit()
	emit_signal("hit")
