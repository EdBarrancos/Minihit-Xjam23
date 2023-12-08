extends Node3D

func _on_bullet_hit():
	queue_free()
