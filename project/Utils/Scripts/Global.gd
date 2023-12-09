extends Label

var score = 0


func _child_was_hit():
	score += 10
