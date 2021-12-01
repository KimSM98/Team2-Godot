extends Node2D

export(NodePath) var destinationPath
export(float) var speed = 5

onready var characterNode = get_parent()
var destinationNode

var originPos
var destPos = Vector2()
var isMoveToDestination = true
var t = 0.0

func _ready():
	originPos = characterNode.position
	destinationNode = get_node(destinationPath)
	
	destPos = Vector2(destinationNode.global_position)

func _process(delta):
	move(delta)

func move(var delta):	
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
		
func init():
	t = 0.0
	speed = rand_range(1, 5)
	isMoveToDestination = true


