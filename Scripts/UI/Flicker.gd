extends TextureRect

var alpha = 1.0
var isReducing = true

func _process(delta):
	if isReducing == true:
		if alpha <= 0:
			isReducing = false
	else:
		if alpha >= 1:
			isReducing = true
	if isReducing == true:
		alpha -= delta * 1
	else:
		alpha += delta * 1
	
	modulate = Color(1,1,1, alpha)
