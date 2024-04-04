extends MeshInstance3D

var time = 1
var starting_pos

func _ready():
	starting_pos = position.y

func _physics_process(delta):
	position.y = starting_pos + sin(time) / 10
	rotation.y = rotation.y + 0.02
	time += 0.05
