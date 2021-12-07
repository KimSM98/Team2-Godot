extends "res://Scripts/Enemy/Enemy.gd"

class_name Cat
onready var animatedSprite = $AnimatedSprite
onready var PlayerNode = get_node("/root/Main/Player")

export (float) var speed = 180
export (float) var distance = 80

var currentAnimation;
var target = Vector2()
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	target = PlayerNode.position
	currentAnimation = "Idle"
	
func _process(delta):
	target = PlayerNode.position
	
	var distanceToTarget = position.distance_to(target)
	if(distanceToTarget < distance):
		currentAnimation = "Move"
		move()
	else:
		currentAnimation = "Idle"
		
	if currentAnimation != animatedSprite.animation:	
		setAnimation()	

func move():
	target = PlayerNode.position
	# Set velocity toward the target.
	velocity = position.direction_to(target) * speed	
	velocity = move_and_slide(velocity)
	
	if(target.x > position.x):
		animatedSprite.flip_h = false
	else:
		animatedSprite.flip_h = true
	
func setAnimation():
	animatedSprite.animation = currentAnimation
	animatedSprite.play()

func delete():
	queue_free()

func attack(var player):
	player.getCatObject(self)
