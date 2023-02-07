extends KinematicBody2D


export var patrol = false
export var moveRight = true
export var walkrange = 200

var chasing = false
var wait = false
var normalSpeed = 1
var runSpeed = 5.5
var currentSpeed = normalSpeed
var origin = position.x
var paused = false

func _ready():
	add_to_group("pausedWhenMini")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if paused: return
	
	if chasing:
		$AudioStreamPlayer2D.volume_db = 6
		currentSpeed = runSpeed
		$Body.animation = "run"

	elif wait: return
	else:
		currentSpeed = normalSpeed
		$AudioStreamPlayer2D.volume_db = -14
		$Body.animation = "walk"
		
	
	var collision
	if moveRight:
		collision = move_and_collide(Vector2(currentSpeed,0))
	if not moveRight:
		collision = move_and_collide(Vector2(-currentSpeed,0))
	
	if collision and "Player" in collision.collider.name:
		get_tree().reload_current_scene()
		
func flip():
		moveRight = not moveRight
		scale.x *= -1
		
func wait(time):	
	wait = true
	$AudioStreamPlayer2D.volume_db = -90
	$Body.animation = "stand"
	$WaitTime.start(time)
	
func pause():
	$AudioStreamPlayer2D.volume_db = -90
	$Body.animation = "stand"
	paused = true

func unpause():
	paused = false

func _on_WaitTime_timeout():
	wait = false

func _on_BackViewArea_body_entered(body):
	if paused: return
	if "Player" in body.name:
		$WaitTime.stop()
		wait = false
		chasing = true
		flip()

func _on_FrontViewArea_body_entered(body):
	if paused: return
	if "Player" in body.name:
		$WaitTime.stop()
		wait = false
		chasing = true

func _on_FrontViewArea_body_exited(body):
	if paused: return
	chasing = false

func _on_BackViewArea_body_exited(body):
	if paused: return
	chasing = false
