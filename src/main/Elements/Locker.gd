extends Area2D

var atLocker = false
var soundPlayed = false

func _process(delta):
	if atLocker and Input.is_key_pressed(KEY_E):
		$"../Player".hide()

func _on_Locker_body_entered(body):
	$Sprite.animation = "opening"
	$DoorSound.play()

	atLocker = true

func _on_Locker_body_exited(body):
	$Sprite.animation = "closing"

	$DoorSound.stop()
	atLocker = false

