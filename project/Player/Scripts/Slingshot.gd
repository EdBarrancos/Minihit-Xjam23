extends Node3D

@onready var animation_player = $AnimationPlayer

func shoot():
	animation_player.play("shoot")
