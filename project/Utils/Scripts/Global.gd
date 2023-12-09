extends Node

var score = 0
var current_child = 0

signal score_increased

func _child_was_hit():
	score += 10
	_child_despawned()
	emit_signal("score_increased")
	
func _child_caught_gameboy():
	score -= 5
	
func _child_left_store():
	score -= 5
	
func _child_despawned():
	current_child -= 1

func _child_spawned():
	current_child += 1
