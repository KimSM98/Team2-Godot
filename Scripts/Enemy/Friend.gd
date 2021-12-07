extends "res://Scripts/Enemy/Enemy.gd"

export(SpriteFrames) var spriteFrames

onready var animatedSprite = $AnimatedSprite

var currentAnimation
var lastPosition

func _ready():
	get_node("AnimatedSprite").frames = spriteFrames
	lastPosition = position

func _process(delta):
	var gapX = position.x - lastPosition.x
	var gapY = position.y - lastPosition.y
	if(gapX > 0):
		currentAnimation = "MoveRight"
	elif(gapX < 0):
		currentAnimation = "MoveLeft"
	elif(gapY > 0):
		currentAnimation = "MoveDown"
	elif(gapY < 0):
		currentAnimation = "MoveUp"
	else:
		currentAnimation = "default"
		
	lastPosition = position
	
	if currentAnimation != animatedSprite.animation:
		SetAnimation()

func SetAnimation():		
	animatedSprite.animation = currentAnimation
	animatedSprite.play()

func attack(var player):
	player.speedDown()
