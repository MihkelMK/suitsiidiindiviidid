extends Area2D

var important = false
var importantFirstHit = false
var moveRight = true
var positions = [Vector2(24, 120), Vector2(104, 120), Vector2(24, 360), Vector2(104, 360)]

export (int) var speed = 2

var hp = 1

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

var i = 0


func _process(delta):
	if global_position.x <= 100:
		moveRight = true
	elif global_position.x >=900:
		moveRight = false
	
	if moveRight:
		global_position.x += speed
	else:
		global_position.x -= speed


func _on_LendavElement_body_entered(body):
	if body.has_method("shot"):
		body.shot()
	queue_free() # Replace with function body.
