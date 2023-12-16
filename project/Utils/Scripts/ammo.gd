extends Label

# Called when the nodenters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Ammo : " + str(Global.current_ammo)
