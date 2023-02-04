extends StaticBody2D

var important = false


func hit():
	if !important: queue_free()
	
	else:
		get_child(0).region_rect.position.x = get_child(0).region_rect.size.x
		important = false

func makeImportant():
	important=true
