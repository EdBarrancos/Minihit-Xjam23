extends Area3D

@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Child"):
		self.visible = false
		timer.start()
		#queue_free()
		pass

func _on_timer_timeout():
	self.visible = true
