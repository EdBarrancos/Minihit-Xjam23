extends Node3D

@onready var animation_player = $AnimationPlayer
@onready var marker_3d = $Marker3D

signal shoot_animation_ended

func charge():
	animation_player.play("Sling_load")

func shoot():
	animation_player.play("Sling_bounce")
	animation_player.seek(1.7)


func _on_animation_player_animation_finished(anim_name):
	print(anim_name == "Sling_bounce")
	if anim_name == "Sling_bounce":
		emit_signal("shoot_animation_ended")
