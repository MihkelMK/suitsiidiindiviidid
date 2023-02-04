extends KinematicBody2D

export var speed = 5
var atLadder = false
var atLocker = false
var hiding = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$HideTimeout.is_stopped(): return
	
	if atLocker and Input.is_key_pressed(KEY_E):
		hide()
		
	else:
		if atLadder and position.y == 288 and Input.is_action_just_pressed("ui_up"):
			position -= Vector2(0,100)
			unhide()

		if atLadder and position.y == 188 and Input.is_action_just_pressed("ui_down"):
			position += Vector2(0,100)
		
		if Input.is_action_pressed("ui_right"):
			unhide()
			move_and_collide(Vector2(speed,0))
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.playing = true
		
		elif Input.is_action_pressed("ui_left"):
			unhide()
			move_and_collide(Vector2(-speed,0))
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.playing = true
			
		else:
			$AnimatedSprite.playing = false
		
func unhide():
	if hiding:
		$CollisionShape2D.disabled = false
		scale = Vector2(1, 1)
		modulate = Color(1,1,1,1)
		hiding = false

func hide():
	if !hiding:
		$AnimatedSprite.playing = false
		$HideTimeout.start()
		scale = Vector2(0.9, 0.9)
		move_and_collide(Vector2(0,0))
		modulate = Color(0.5,0.5,0.5,1)
		$CollisionShape2D.disabled = true
		hiding = true

func _on_Ladder_body_entered(body):
	atLadder = true

func _on_Ladder_body_exited(body):
	atLadder = false

func _on_Locker_body_entered(body):
	atLocker = true

func _on_Locker_body_exited(body):
	atLocker = false
