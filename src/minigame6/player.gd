extends Sprite

signal shoot(bullet, direction, location)

var Bullet = preload("res://minigame6/Bullet.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("shoot", Bullet, rotation, position)

func _process(delta):
	look_at(get_global_mouse_position())
	

func _on_Player_shoot(Bullet, direction, location):
	var spawned_bullet = Bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.rotation = direction
	spawned_bullet.position = location
	spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
