extends Node

@export var seconds_until_deletion: float
@onready var timer: Timer = $Timer

@export var on_animation_finished_name : StringName

# Called when the node enters the scene tree for the first time.
func _ready():
	if seconds_until_deletion > 0:
		timer.set_wait_time(seconds_until_deletion)
		timer.start()

func _on_timer_timeout():
	clear()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == on_animation_finished_name:
		clear()
		
func clear():
	get_parent().queue_free()
