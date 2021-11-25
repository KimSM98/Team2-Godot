extends KinematicBody2D

class_name Player

onready var animatedSprite = $AnimatedSprite

export (float) var speed = 200
var velocity = Vector2()
var currentAnimation;

# Called when the node enters the scene tree for the first time.
func _ready():
	currentAnimation = "default"

func _process(delta):
	GetInput()
	move_and_slide(velocity)

func GetInput():
	# Move 
	var axisX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var axisY = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = Vector2(axisX, axisY)
	velocity = velocity.normalized() * speed
	
	# Movement Animation
	if axisX == 1:
		currentAnimation = "MoveRight"		
	elif axisX == -1:
		currentAnimation = "MoveLeft"
	elif axisY == -1:
		currentAnimation = "MoveUp"
	elif axisY == 1:
		currentAnimation = "MoveDown"
	else:
		currentAnimation = "default"
	# To ignore replaying same animation
	if currentAnimation != animatedSprite.animation:	
		SetAnimation()

func SetAnimation():
	animatedSprite.animation = currentAnimation
	animatedSprite.play()
	
