extends Node3D

@onready var animation_player = $AnimationPlayer
@onready var marker_3d = $Marker3D

signal shoot_animation_ended

func charge():
	animation_player.play("Sling_load")

func shoot():
	var charging = \
		animation_player.current_animation_position if \
		animation_player.is_playing() else\
		1.0
	animation_player.play("Sling_bounce")
	animation_player.seek(1.7)
	return maximum(charging, 1.0)
	
func maximum(number: float, maximum: float):
	if number > maximum:
		return maximum
	return number


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Sling_bounce":
		emit_signal("shoot_animation_ended")
