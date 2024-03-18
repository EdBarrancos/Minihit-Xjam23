extends Area3D

@onready var timer = $Timer

var time = 1
var starting_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	starting_pos = position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	position.y = starting_pos + sin(time) / 10
	rotation.y = rotation.y + 0.05
	time += 0.05

func _on_body_entered(body):
	if body.is_in_group("Child"):
		self.visible = false
		timer.start()
		#queue_free()
		pass

func _on_timer_timeout():
	self.visible = true
