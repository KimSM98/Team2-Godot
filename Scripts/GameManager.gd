extends Node

class_name GameManager

export(NodePath) var collectibleCountLabelPath
onready var collectibleCountLabel = get_node(collectibleCountLabelPath)
export(NodePath) var maxCollectibleCountLabelPath
onready var maxCollectibleCountLabel = get_node(maxCollectibleCountLabelPath)

onready var collectiblesNode = get_node("Collectibles")

var score
# Max number of collectible item
var collectibleMaxCount = 0
# collectible item count that player collected
var collectibleCount = 0

var time

func _ready():
	updateMaxCount()
	updateCollectibleCount()

func addAssignmentCount():
	collectibleCount += 1
	updateCollectibleCount()
	
func updateMaxCount():
	collectibleMaxCount = collectiblesNode.get_child_count()
	maxCollectibleCountLabel.text = "/" + str(collectibleMaxCount)

func updateCollectibleCount():
	collectibleCountLabel.text = str(collectibleCount)
