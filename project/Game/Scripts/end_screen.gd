extends Control

@onready var points = $MarginContainer/VBoxContainer/MarginContainer2/Points

# Called when the node enters the scene tree for the first time.
func _ready():
	points.text = str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_parent().loadGame()
