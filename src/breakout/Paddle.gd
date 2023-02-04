extends StaticBody2D

export var speed = 350
var direction = 0
var screen_size 
var half_w


# Called when the node enters the scene tree for the first time.
func _ready():
	# Take screen size into var
	screen_size = get_viewport_rect()
	half_w = ($Sprite.texture.get_width())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Position at the moment
	position = get_position()
	
	# Take Input
	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1
	else:
		direction = 0
	
	# Calculate movement direction
	var movement = Vector2(direction * speed * delta, 0)
	
	# Move paddle
	set_position(position + movement)
	
	
	# Clamp to screen
	if position.x + half_w >= screen_size.size.x:
		set_position(Vector2(screen_size.size.x - half_w, get_position().y))
	
	if position.x - half_w <= 0:
		set_position(Vector2(half_w, get_position().y))
	
	
	
