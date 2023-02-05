extends Area2D

export(int) var TEXTURE_WIDTH: int = 12

export var game: String
export var texture: int

var atArcade = false

func _ready():
	get_child(0).region_rect.position.x = texture * TEXTURE_WIDTH

func _process(delta):
	if atArcade and Input.is_key_pressed(KEY_E):
		$"../Player".startMini(game)

func _on_Locker_body_entered(body):
	atArcade = true

func _on_Locker_body_exited(body):
	atArcade = false
