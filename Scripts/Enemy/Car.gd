extends "res://Scripts/Enemy/Enemy.gd"

# Get window size : OS.get_windows_size()
# Get viewport size : get_viewport().get_rect().size

export(SpriteFrames) var spriteFrames

onready var animatedSprite = $AnimatedSprite
onready var patrollerNode = get_node("Patroller")

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
		currentAnimation = "MoveDown"
		
	lastPosition = position
	
	if currentAnimation != animatedSprite.animation:
		SetAnimation()
		
	if patrollerNode != null:
		if patrollerNode.isMoveToDestination == false:
			patrollerNode.init()
			patrollerNode.setSpeed(rand_range(1, 5))
			visible = true			

func SetAnimation():		
	animatedSprite.animation = currentAnimation
	animatedSprite.play()
	
func attack(player):
	player.gameOver()
