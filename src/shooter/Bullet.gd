extends KinematicBody2D

var velocity = Vector2(1, 0)
var speed = 300

func _ready():
	if get_viewport().get_mouse_position().x < 500:
		$Icon.flip_h = true

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * speed)
	if collision and ("Wall" in collision.collider.name or "Ceiling" in collision.collider.name or "Floor" in collision.collider.name):
		queue_free()

func shot() -> void:
	queue_free()
