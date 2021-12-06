extends Node

class_name GameManager

export(NodePath) var collectibleCountLabelPath
onready var collectibleCountLabel = get_node(collectibleCountLabelPath)
export(NodePath) var maxCollectibleCountLabelPath
onready var maxCollectibleCountLabel = get_node(maxCollectibleCountLabelPath)
export(NodePath) var scoreLabelPath
onready var scoreLabel = get_node(scoreLabelPath)

onready var collectiblesNode = get_node("Collectibles")

var score
# Max number of collectible item
var collectibleMaxCount = 0
# collectible item count that player collected
var collectibleCount = 0

var time

func _ready():
	scoreLabel.visible = false
	updateMaxCount()
	updateCollectibleCount()

# Update Labels
func updateMaxCount():
	collectibleMaxCount = collectiblesNode.get_child_count()
	maxCollectibleCountLabel.text = "/" + str(collectibleMaxCount)

func updateCollectibleCount():
	collectibleCountLabel.text = str(collectibleCount)

func updateScoreLabel():
	scoreLabel.text = "SCORE\n" + str(score)
	
func addAssignmentCount():
	collectibleCount += 1
	updateCollectibleCount()

func getScore():
	var val = collectibleCount * 100 / collectibleMaxCount
	print(val)
	if val > 80:
		score = "A"
	elif val > 60:
		score = "B"
	elif val > 40:
		score = "C"
	elif val > 20:
		score = "D"
	else:
		score = "F" 
	print(score)
	
	updateScoreLabel()
	scoreLabel.visible = true;
	
func gameOver():
	getScore()
	
	get_tree().paused = true
