extends Area2D

var atLocker = false

func _process(delta):
	if atLocker and Input.is_key_pressed(KEY_E):
		$"../Player".hide()

func _on_Locker_body_entered(body):
	$Sprite.animation = "opening"
	atLocker = true

func _on_Locker_body_exited(body):
	$Sprite.animation = "closing"
	atLocker = false
