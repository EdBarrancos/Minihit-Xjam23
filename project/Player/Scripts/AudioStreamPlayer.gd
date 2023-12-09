extends AudioStreamPlayer

@export var pitch_range = Vector2(0.7, 1.3)
@onready var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_finished():
	self.pitch_scale = rng.randf_range(pitch_range.x, pitch_range.y)
