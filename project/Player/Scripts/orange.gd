extends Projectile

@export var SPEED: float = 0.3
@export var GRAVITY: float = 0

enum MODE { LOADED, SHOOTING }

@onready var mode = MODE.LOADED

var marker_loaded

@onready var expiration = $Expiration

func _on_bullet_hit():
	queue_free()
	
func shoot():
	mode = MODE.SHOOTING
	expiration.start_counting()

func _process(delta):
	if mode == MODE.SHOOTING:
		position += transform.basis * Vector3(0, 0, -SPEED)
		position += Vector3(0,-GRAVITY, 0)
	elif mode == MODE.LOADED and marker_loaded != null:
		position = marker_loaded.global_position
