extends Projectile

@export var SPEED_MIN: float = 0.15
@export var SPEED_MAX: float = 0.7
@export var GRAVITY: float = 0

@onready var speed = SPEED_MIN

enum MODE { LOADED, SHOOTING }

@onready var mode = MODE.LOADED

var marker_loaded

@onready var expiration = $Expiration

func _on_bullet_hit():
	queue_free()
	
func shoot(charge_value:float):
	mode = MODE.SHOOTING
	expiration.start_counting()
	speed = (SPEED_MAX - SPEED_MIN) * charge_value + SPEED_MIN

func _process(delta):
	if mode == MODE.SHOOTING:
		position += transform.basis * Vector3(0, 0, -speed)
		position += Vector3(0,-GRAVITY, 0)
	elif mode == MODE.LOADED and marker_loaded != null:
		position = marker_loaded.global_position
