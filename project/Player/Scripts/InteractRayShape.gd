extends ShapeCast3D


@onready var prompt = $Prompt
# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception(owner)
	target_position = Vector3(0, 0, -2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	prompt.text = ""
	
	if is_colliding():
		var detected = get_collider(0)
		
		if(detected != null && detected.name == "FruitBoxReload"):
			prompt.text = "Press E to reload"
			Global.can_reload = true
			return
			
	Global.can_reload = false
