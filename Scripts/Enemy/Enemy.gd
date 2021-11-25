extends KinematicBody2D

export(int) var damage = 10
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	detectCollision()

func detectCollision():
	var collision = move_and_collide(Vector2())
	if !collision:
		return
	else:
		if collision.collider is Player:
			print("Ouch...")
			#collision.collider._reduce_health(damage)
