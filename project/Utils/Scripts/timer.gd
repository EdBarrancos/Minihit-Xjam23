extends Control

var seconds = 0
var minutes = 0
var Dseconds = 0
var Dminutes = 2

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	_reset_timer()
	

func _on_timer_timeout():
	
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	
	if(seconds < 10):
		label.set_text(str(minutes) + ":0" + str(seconds))
	else:
		label.set_text(str(minutes) + ":" + str(seconds))
	
	if seconds == 0 and minutes == 0:
		#Maybe do something different here, like go to scoreboard
		get_tree().quit()

func _reset_timer():
	seconds = Dseconds
	minutes = Dminutes
