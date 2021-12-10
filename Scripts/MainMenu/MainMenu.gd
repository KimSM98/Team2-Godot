extends Node


export(NodePath) var level2_ButtonPath
onready var level2_Button = get_node(level2_ButtonPath)
export(NodePath) var level1_ButtonPath
onready var level1_Button = get_node("UI/Level1")
onready var creditButton = get_node("UI/Credit")
onready var creditRect = get_node("UI/CreditRect")

# Called when the node enters the scene tree for the first time.
func _ready():
	initializeButtons()
	
	hideCredit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func initializeButtons():
	level1_Button.connect("pressed", self, "startLevel1")
	level2_Button.connect("pressed", self, "startLevel2")
	creditButton.connect("pressed", self, "creditButtondFunc")
	
func startLevel1():
	get_tree().change_scene("res://Level1.tscn")
	get_tree().paused = false

func startLevel2():
	get_tree().change_scene("res://Level2.tscn")
	get_tree().paused = false

func showCredit():
	creditRect.visible = true;
	
func hideCredit():
	creditRect.visible = false;

func creditButtondFunc():
	if creditRect.visible == true:
		hideCredit()
	else:
		showCredit()

