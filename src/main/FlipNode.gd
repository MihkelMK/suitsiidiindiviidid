extends Area2D

export var time: float = 0

func _on_FlipNode_body_entered(body):
	body.wait(time)
	body.flip()
