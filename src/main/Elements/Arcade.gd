extends Area2D

export var game: String

var atArcade = false

func _process(delta):
	if atArcade and Input.is_key_pressed(KEY_E):
		$"../Player".startMini(game)

func _on_Locker_body_entered(body):
	$Sprite.animation = "opening"
	atArcade = true

func _on_Locker_body_exited(body):
	$Sprite.animation = "closing"
	atArcade = false
