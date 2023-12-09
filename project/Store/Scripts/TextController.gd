extends MarginContainer

@export var first_text = "Do not let the children take YOUR gameboys"
@export var second_text = "By ANY means necessary"
@onready var label = $Label

@onready var current_text = 1

@onready var timer_2 = $"Timer2"

signal start

func _ready():
	label.text = first_text


func _on_timer_2_timeout():
	if current_text == 1:
		current_text += 1
		label.text = second_text
		timer_2.start()
	elif current_text == 2:
		label.visible = false
		emit_signal("start")
		
