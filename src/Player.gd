extends KinematicBody2D

export var speed = 5
var atLadder = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)
	atLadder = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed,0))
	
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed,0))
	
	if atLadder == true:
		if position.y == 288 and Input.is_action_just_pressed("ui_up"):
			position -= Vector2(0,100)
		if position.y == 188 and Input.is_action_just_pressed("ui_down"):
			position += Vector2(0,100)
	
	if is_on_floor() == true:
		print("floor")
	
	pass


func _on_Ladder_body_entered(body):
	atLadder = true
	print(atLadder)



func _on_Ladder_body_exited(body):
	atLadder = false
	print(atLadder)
	pass # Replace with function body.
