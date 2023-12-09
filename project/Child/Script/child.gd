extends CharacterBody3D

const SPEED = 5
const ACCELERATION = 10

@onready var nav: NavigationAgent3D = $NavigationAgent3D

var caught_gameboy = false
var gameboy = null
var door = null

func _set_gameboy(GameBoy):
	gameboy = GameBoy
	gameboy.body_entered.connect(_on_gameboy_body_entered)

func _set_door(Door):
	door = Door
	door.body_entered.connect(_on_door_body_entered)
	
func _physics_process(delta):
	
	look_at(nav.get_next_path_position())
	
	var direction = Vector3()

	if(door and caught_gameboy):
		nav.target_position = door.global_position
	elif(door and is_instance_valid(gameboy)):
		nav.target_position = gameboy.global_position

	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, ACCELERATION * delta)
	
	move_and_slide()

func _on_gameboy_body_entered(body):
	if(body == self):
		caught_gameboy = true

func _on_door_body_entered(body):
	if(body == self):
		queue_free()

func _on_shootable_was_hit():
	Global._child_was_hit()
	queue_free()
