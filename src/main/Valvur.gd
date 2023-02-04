extends KinematicBody2D


export var patrol = false
export var direction = true
export var walkrange = 200

var wait = false
var origin = position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	origin = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not wait:
		$Sprite.animation = "walk"
		if direction:
			move_and_collide(Vector2(1,0))
		#print("parem")
		if not direction:
			move_and_collide(Vector2(-1,0))
		#print("vasak")

# Deprecated
func _patrol():
	print(origin)
	print(position.x)
	if (origin >= position.x or position.x >= origin+walkrange):
		flip()
		
	if direction:
		move_and_collide(Vector2(1,0))
		#print("parem")
		
	if not direction:
		move_and_collide(Vector2(-1,0))
		#print("vasak")
		
func flip():
		direction = not direction
		scale.x *= -1
		print("Flip!")
		
func wait(time):
	wait = true
	$Sprite.animation = "stand"
	$WaitTime.start(time)

func _on_ViewArea_body_entered(body):
	print("KUULE!")


func _on_WaitTime_timeout():
	wait = false


func _on_TimerNode_body_entered(body):
	wait(5)
