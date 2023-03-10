extends KinematicBody2D

var speed = 300
var direction = Vector2.ZERO

func _ready():
	direction=Vector2(speed, speed)
	
func _physics_process(delta):
	var collision= move_and_collide(direction*delta)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		direction = direction.bounce(collision.normal)
		move_and_collide(reflect)
		
		if "Floor" in collision.collider.name:
			$"../../Breakout".stopGame(false)
		elif "Brick" in collision.collider.name:
			$AudioStreamPlayer2D2.play()
			collision.collider.hit()
		else:
			$AudioStreamPlayer2D.play()
		
func stopMovement():
	direction = Vector2.ZERO
