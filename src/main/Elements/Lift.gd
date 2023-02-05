extends Area2D

export var goesToPath: NodePath
onready var goesToNode = get_node(goesToPath)
var atLift = false

func _process(delta):
	if !$MoveTimeout.is_stopped(): return

	if atLift and Input.is_key_pressed(KEY_E):
		goesToNode.get_child(0).animation = "opening"
		$"../Player".position.x = get_position().x
		$MoveTimeout.start()
		$"../Player".hide()
		
func _on_Lift_body_entered(body):
	$AnimatedSprite.animation = "opening"
	atLift = true

func _on_Lift_body_exited(body):
	$AnimatedSprite.animation = "closing"
	atLift = false

func _on_MoveTimeout_timeout():
	$"../Player".position.y = goesToNode.get_position().y + 8
