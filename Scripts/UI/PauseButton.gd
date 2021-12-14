extends TextureButton

var pauseImage = load("res://Assets/UI/PauseButton.png")
var resumeImage = load("res://Assets/UI/ResumeButton.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "pauseButton")

func pauseButton():
	var isPaused = get_tree().paused	
	if isPaused == true:
		resume()
	else:
		pause()

func pause():	
	get_tree().paused = true
	self.texture_normal = resumeImage

func resume():
	get_tree().paused = false
	self.texture_normal = pauseImage
	
