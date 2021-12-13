extends AudioStreamPlayer

onready var carAccidentSound = load("res://Sounds/CarHorn.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func playCarAnccident():
	self.stream = carAccidentSound
	self.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

