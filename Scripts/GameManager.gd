extends Node

class_name GameManager

export(NodePath) var collectibleCountLabelPath
onready var collectibleCountLabel = get_node(collectibleCountLabelPath)
export(NodePath) var maxCollectibleCountLabelPath
onready var maxCollectibleCountLabel = get_node(maxCollectibleCountLabelPath)
export(NodePath) var gameOverUIPath
onready var gameOverUI = get_node(gameOverUIPath)
export(NodePath) var scoreLabelPath
onready var scoreLabel = get_node(scoreLabelPath)
export(NodePath) var restartButtonPath
onready var restartButton = get_node(restartButtonPath)
export(NodePath) var gameStartUIPath
onready var gameStartUI = get_node(gameStartUIPath)
export(NodePath) var catItemUIPath
onready var catItemUI = get_node(catItemUIPath)

onready var collectiblesNode = get_node("Collectibles")

var score
# Max number of collectible item
var collectibleMaxCount = 0
# collectible item count that player collected
var collectibleCount = 0

var time

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

func updateScoreLabel():
	scoreLabel.text = "SCORE\n" + str(score)
	
func addAssignmentCount():
	collectibleCount += 1
	updateCollectibleCount()

func getScore():
	var val = collectibleCount * 100 / collectibleMaxCount
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
#	scoreLabel.visible = true;
	
func gameOver():
	getScore()
	gameOverUI.visible = true
	get_tree().paused = true
	
func gameStart():
	gameStartUI.visible = true
	get_tree().paused = true
	
func showCatItemUI():
	catItemUI.visible = true

func hideCatItemUI():
	catItemUI.visible = false

func initializeButton():
	restartButton.connect("pressed", self, "restart")
	
func restart():
	get_tree().change_scene("res://Level2.tscn")
	get_tree().paused = false
	print("Restart")
