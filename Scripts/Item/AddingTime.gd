extends Area2D

export(int) var timeVal = 10

func _on_TimerItem_body_entered(body):
	body.addTime(timeVal)
	queue_free()
