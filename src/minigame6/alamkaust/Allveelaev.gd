extends StaticBody2D

var important = false
var importantFirstHit = false
var positions = [Vector2(24, 120), Vector2(104, 120), Vector2(24, 360), Vector2(104, 360)]

func hit():
	if !important: queue_free()
	
	elif importantFirstHit:
		get_parent().stopGame()
		queue_free()
		print(get_parent())
	
	else:
		get_child(0).region_rect.position.x += 56
		importantFirstHit = true

func makeImportant():
	important = true

func _process(delta):
	rotation_degrees += 1.5
	print(delta.get_pos())
