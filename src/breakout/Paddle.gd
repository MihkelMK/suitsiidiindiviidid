extends KinematicBody2D

export var speed = 500
var direction = 0
var screen_size 
var half_w


# Called when the node enters the scene tree for the first time.
func _ready():
	# Take screen size into var
	screen_size = get_viewport_rect()
#	half_w = ($Wall/Sprite.texture.get_width())
	half_w = 32

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Take Input
	if Input.is_action_pressed("ui_left"):
		direction = -speed
	elif Input.is_action_pressed("ui_right"):
		direction = speed
	else:
		direction = 0
	
func _physics_process(delta):
	var collision = move_and_collide(Vector2(direction*delta, 0))
	if collision and "Wall" in collision.collider.name:
		direction = 0
		move_and_collide(Vector2.ZERO)

func stopMovement():
	speed = 0
