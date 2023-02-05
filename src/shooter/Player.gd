extends KinematicBody2D

const bulletPath = preload('res://shooter/Bullet.tscn')

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
	$Node2D.look_at(get_global_mouse_position())

func shoot():
	var bullet = bulletPath.instance()

	get_parent().add_child(bullet)
	bullet.position = Vector2($Node2D/Position2D.global_position.x+50, $Node2D/Position2D.global_position.y+50)
	bullet.velocity = get_global_mouse_position() - bullet.position

