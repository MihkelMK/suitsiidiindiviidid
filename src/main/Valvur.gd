extends KinematicBody2D


export var patrol = false
export var moveRight = true
export var walkrange = 200

var chasing = false
var wait = false
var normalSpeed = 1
var runSpeed = 5
var currentSpeed = normalSpeed
var origin = position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if wait: return
	
	if chasing:
		currentSpeed = runSpeed
		$Body.animation = "run"

	else:
		currentSpeed = normalSpeed
		$Body.animation = "walk"
		
	var collision
	if moveRight:
		collision = move_and_collide(Vector2(currentSpeed,0))
	if not moveRight:
		collision = move_and_collide(Vector2(-currentSpeed,0))
	
	if collision and "Player" in collision.collider.name:
		get_tree().reload_current_scene()

# Deprecated
func _patrol():
	print(origin)
	print(position.x)
	if (origin >= position.x or position.x >= origin+walkrange):
		flip()
		
	if moveRight:
		move_and_collide(Vector2(currentSpeed,0))
		#print("parem")
		
	if not moveRight:
		move_and_collide(Vector2(-currentSpeed,0))
		#print("vasak")
		
func flip():
		moveRight = not moveRight
		scale.x *= -1
		
func wait(time):	
	wait = true
	$Body.animation = "stand"
	$WaitTime.start(time)
	
func _on_WaitTime_timeout():
	wait = false

func _on_BackViewArea_body_entered(body):
	if "Player" in body.name:
		chasing = true
		flip()

func _on_FrontViewArea_body_entered(body):
	if "Player" in body.name:
		chasing = true

func _on_FrontViewArea_body_exited(body):
	chasing = false

func _on_BackViewArea_body_exited(body):
	chasing = false
