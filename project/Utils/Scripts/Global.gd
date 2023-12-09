extends Node

var score = 0

signal score_increased

func _child_was_hit():
	score += 10
	emit_signal("score_increased")
