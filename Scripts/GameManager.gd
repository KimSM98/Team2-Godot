extends Node

class_name GameManager

export(NodePath) var collectibleCountLabelPath
onready var collectibleCountLabel = get_node(collectibleCountLabelPath)
export(NodePath) var maxCollectibleCountLabelPath
onready var maxCollectibleCountLabel = get_node(maxCollectibleCountLabelPath)
# Game Over UI
export(NodePath) var gameOverUIPath
onready var gameOverUI = get_node(gameOverUIPath)
export(NodePath) var stateLabelPath
onready var stateLabel = get_node(stateLabelPath)
export(NodePath) var scoreLabelPath
onready var scoreLabel = get_node(scoreLabelPath)
export(NodePath) var restartButtonPath
onready var restartButton = get_node(restartButtonPath)
# End of Game Over UI

export(NodePath) var catItemUIPath
onready var catItemUI = get_node(catItemUIPath)

onready var collectiblesNode = get_node("Collectibles")

var score
# Max number of collectible item
var collectibleMaxCount = 0
# collectible item count that player collected
var collectibleCount = 0

var time

var gameOverState = "NULL"

func _ready():
	gameOverUI.visible = false
	hideCatItemUI()
	
	updateMaxCount()
	updateCollectibleCount()
	
	initializeButton()
	

# Update Labels
func updateMaxCount():
	collectibleMaxCount = collectiblesNode.get_child_count()
	maxCollectibleCountLabel.text = "/" + str(collectibleMaxCount)

func updateCollectibleCount():
	collectibleCountLabel.text = str(collectibleCount)
	
func updateStateLabel():
	stateLabel.text = gameOverState

func updateScoreLabel():
	scoreLabel.text = "SCORE:" + str(score)
	
func addAssignmentCount():
	collectibleCount += 1
	updateCollectibleCount()

func getScore():
	var val = collectibleCount * 100 / collectibleMaxCount
	
	if(gameOverState == "You are late."):
		val -= 10
	
	if val == 100:
		score = "A+"
	elif val > 80:
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
#	scoreLabel.visible = true;
	
func gameOver():
	updateStateLabel()	
	getScore()
	
	gameOverUI.visible = true
	get_tree().paused = true
	
func showCatItemUI():
	catItemUI.visible = true

func hideCatItemUI():
	catItemUI.visible = false

func initializeButton():
	restartButton.connect("pressed", self, "restart")
	
func restart():
	get_tree().reload_current_scene()
	get_tree().paused = false
	print("Restart")
	
func setGameOverState(var state):
	gameOverState = state
