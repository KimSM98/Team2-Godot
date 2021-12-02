extends Area2D

func _on_CatItem_body_entered(body):
	body.deleteCatObject()
	queue_free()
