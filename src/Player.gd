extends KinematicBody2D

export var speed = 4
var hiding = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$HideTimeout.is_stopped(): return
		
	if Input.is_action_pressed("ui_right"):
		unhide()
		move_and_collide(Vector2(speed,0))
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "walk"
	
	elif Input.is_action_pressed("ui_left"):
		unhide()
		move_and_collide(Vector2(-speed,0))
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
		
	else:
		$AnimatedSprite.animation = "stand"
		
func unhide():
	if hiding:
		$CollisionShape2D.disabled = false
		modulate = Color(1,1,1,1)
		hiding = false

func hide():
	if !hiding:
		$AnimatedSprite.animation = "stand"
		$HideTimeout.start()
		move_and_collide(Vector2(0,0))
		modulate = Color(0.5,0.5,0.5,1)
		$CollisionShape2D.disabled = true
		hiding = true
