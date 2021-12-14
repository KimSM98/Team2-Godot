extends TextureButton

var muteImage = load("res://Assets/UI/SoundMute.png")
var soundOnImage = load("res://Assets/UI/SoundOn.png")

func _ready():
	connect("pressed", self, "muteButton")
	
	var isMute = AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))
	if isMute == true:
		texture_normal = soundOnImage
	else:
		texture_normal = muteImage

func muteButton():
	var isMute = AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))
	
	if isMute == true:
		soundOn()
	else:
		mute()

func mute():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	texture_normal = soundOnImage
	
func soundOn():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	texture_normal = muteImage

