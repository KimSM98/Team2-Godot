extends Item

#var targetPos = Vector2()
#
#func _ready():
#	pass # Replace with function body.
#
##func body_entered(body):
##	if body is Player:
##		queue_free()
### Called every frame. 'delta' is the elapsed time since the previous frame.
###func _process(delta):
###	pass
##
#
func _on_CatItem_body_entered(body):
	body.deleteCatObject()
	queue_free()
