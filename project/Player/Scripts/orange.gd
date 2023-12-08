extends Projectile

@export var SPEED: float = 0.3
@export var GRAVITY: float = 0.08

func _on_bullet_hit():
	queue_free()

func _process(delta):
	position += transform.basis * Vector3(0, 0, -SPEED)
	position += Vector3(0,-GRAVITY, 0)
