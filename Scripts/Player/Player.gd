extends KinematicBody2D

class_name Player

onready var animatedSprite = $AnimatedSprite
onready var gameManagerNode =  get_node("..")
onready var timerNode = get_node("Timer")

export (float) var speed = 200
var initSpeed = 0
var velocity = Vector2()
var currentAnimation;

# Cat item
var catObj = null
var deleteCat = false
# Speed up item 
enum SPEED{NORMAL, UP, DOWN}
var currentSpeedState = SPEED.NORMAL

# HealthBar
var health = 99
var ms = 0
var tmp_ms = 0
var s = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	initSpeed = speed
	currentAnimation = "default"

func _process(delta):
	GetInput()
	move_and_slide(velocity)
	
	$HealthBar.value = health
	
	if ms > 9 :
		s += 1
		ms = 0
		health -= 0.3
	
	if health <= 0:
		gameOver()		

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
		setAnimation()

func setAnimation():
	animatedSprite.animation = currentAnimation
	animatedSprite.play()

# Cat item
func getCatObject(var obj):	
	if(deleteCat == true):
		obj.delete()
		deleteCat = false
		gameManagerNode.hideCatItemUI()

func deleteCatObject():
	gameManagerNode.showCatItemUI()
	deleteCat = true

# Speed up item
func speedUp():
	speed = initSpeed * 2
	currentSpeedState = SPEED.UP
	timerNode.set_wait_time(2)
	timerNode.start()

func speedDown():
	# if player is using speedUp item, speedDown is not work
	if currentSpeedState != SPEED.UP:
		speed = initSpeed / 2
		timerNode.set_wait_time(2)
		timerNode.start()
	
func _on_Timer_timeout():
	speed = initSpeed
	
	currentSpeedState = SPEED.NORMAL
	timerNode.stop()

func getCollectibleItem():
	gameManagerNode.addAssignmentCount()

# Goal
func gameOver():
	gameManagerNode.gameOver()

func reduceHealth(var val):
	health -= val

# Wrote by Lee Seoyoung
# Healthbar hit by a car
func _reduce_health(): 
	if ms  == 5 || ms  == 0:
		health -= 2
		
	

# Healthbar as time goes
func _on_ms_timeout(): 
#	print(health)
	ms += 1
# End of scripts wrote by Lee Seoyoung

func addTime(var val):
	
	var temp = health + val
	health = min(temp, 99)
	print(health)
