extends Area3D

class_name Shootable

signal was_hit

func hit():
	emit_signal("was_hit")
