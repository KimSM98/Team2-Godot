extends Node2D

export(NodePath) var destinationPath
export(float) var speed = 5
export (float) var distance = 80

# AI state
enum STATE{PATROL, CHASE}
var currentState = STATE.PATROL

# Nodes
onready var PlayerNode = get_node("/root/Main/Player")
onready var characterNode = get_parent()
var destinationNode

# Chase
var target = Vector2()
var velocity = Vector2()

# Patrol
var originPos
var destPos = Vector2()
var isMoveToDestination = true
var t = 0.0

# Move to origin
var currentPos  

func _ready():
	originPos = characterNode.position
	destinationNode = get_node(destinationPath)
	
	destPos = Vector2(destinationNode.global_position)

func _process(delta):
	var distanceToTarget = position.distance_to(target)
	if(distanceToTarget < distance):
		currentState = STATE.CHASE
	else:
		if(currentState == STATE.CHASE):
			# return to oring position
			pass
		currentState = STATE.PATROL
	
	if currentState is STATE.PATROL:
		patrol(delta)

func patrol(var delta):	
	var speedVar = 0.0
	if isMoveToDestination == true:
		speedVar = speed
		if(t > 1):
			isMoveToDestination = false
	else:
		speedVar = speed * -1
		if(t < 0):
			isMoveToDestination = true
			
	t += delta * 0.1 * speedVar
	# Move
	characterNode.position = originPos.linear_interpolate(destPos, t)		

func chase(var delta):
	target = PlayerNode.position
	# Set velocity toward the target.
	velocity = position.direction_to(target) * speed	
	velocity = characterNode.move_and_slide(velocity)
	
	if(target.x > position.x):
		characterNode.animatedSprite.flip_h = false
	else:
		characterNode.animatedSprite.flip_h = true
		
func moveToOrigin():
	pass
func init():
	t = 0.0
	isMoveToDestination = true

func setSpeed(var speedVal):
	speed = speedVal
