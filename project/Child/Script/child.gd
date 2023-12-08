extends CharacterBody3D


const SPEED = 5
const ACCELERATION = 10

#Might need to change the way we have the targets in here
@export var target: MeshInstance3D
@export var door_target: MeshInstance3D

@onready var nav: NavigationAgent3D = $NavigationAgent3D

var caught_gameboy = false

func _physics_process(delta):
	
	var direction = Vector3()
	
	if(caught_gameboy):
		nav.target_position = door_target.global_position
	else:
		nav.target_position = target.global_position

	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, ACCELERATION * delta)
	
	move_and_slide()
	
	print(caught_gameboy)


func _on_navigation_agent_3d_target_reached():
	if(not caught_gameboy):
		get_parent().get_node("Gameboy").queue_free()
		caught_gameboy = true
	else:
		queue_free()
		
	
	
