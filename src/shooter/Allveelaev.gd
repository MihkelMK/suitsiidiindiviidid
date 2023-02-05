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
	
	else:
		get_child(0).region_rect.position.x += 56
		importantFirstHit = true

func makeImportant():
	important = true

var i = 0

func _ready():
	add_to_group("boats")

func _process(delta):
	if global_position.x <= 400:
		moveRight = true
		$Allveelaev.flip_h = true
	elif global_position.x >=1000:
		moveRight = false
		$Allveelaev.flip_h = false
		
	if moveRight:
		global_position.x += speed
	else:
		global_position.x -= speed


func _on_LendavElement_body_entered(body):
	if body.has_method("shot"):
		body.shot()
	queue_free() # Replace with function body.
