extends CharacterBody3D


const SPEED = 5
const ACCELERATION = 10

#Might need to change the way we have the targets in here
#@export var target: Area3D
#@export var door_target: Area3D



@onready var nav: NavigationAgent3D = $NavigationAgent3D

var caught_gameboy = false

var gameboy
var door

func _init(GameBoy, Door):
	gameboy = GameBoy
	door = Door

func _set_gameboy(GameBoy):
	gameboy = GameBoy

func _set_door(Door):
	door = Door
	
func _physics_process(delta):
	
	var direction = Vector3()
	
	if(caught_gameboy):
		nav.target_position = door.global_position
	else:
		nav.target_position = gameboy.global_position

	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, ACCELERATION * delta)
	
	move_and_slide()
	
	


#func _on_navigation_agent_3d_target_reached():
#	if(not caught_gameboy):
#		get_parent().get_node("Gameboy").queue_free()
#		caught_gameboy = true
#	else:
#		queue_free()
		
	
	



func _on_gameboy_body_entered(body):
	caught_gameboy = true
	


func _on_door_body_entered(body):
	if body.is_in_group("Child"):
		#queue_free()
		pass
