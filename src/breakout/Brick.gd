extends StaticBody2D

var important = false
var importantFirstHit = false


func hit():
	if !important: queue_free()
	
	elif importantFirstHit:
		get_parent().stopGame(true)
		queue_free()
	
	else:
		get_child(0).region_rect.position.x += 56
		importantFirstHit = true

func makeImportant():
	important = true
