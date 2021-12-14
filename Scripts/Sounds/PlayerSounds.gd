extends AudioStreamPlayer

onready var carAccidentSound = load("res://Sounds/Crash.mp3")
onready var speedUpSound = load("res://Sounds/Item/SpeedUp.mp3")
onready var catItemSound = load("res://Sounds/Item/CatItem.mp3")
onready var addTimeSound = load("res://Sounds/Item/AddTime.mp3")
onready var collectibleSound = load("res://Sounds/Item/Collectible.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func playCarAnccident():
	self.stream = carAccidentSound
	self.play()

func playSpeedUp():
	self.stream = speedUpSound
	self.play()
		
func playCatItem():
	self.stream = catItemSound
	self.play()
		
func playAddTime():
	self.stream = addTimeSound
	self.play()

func playCollectible():
	self.stream = collectibleSound
	self.play()
	

