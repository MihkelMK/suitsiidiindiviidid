extends Area2D

export var time = 0
export var force = false

func _on_FlipNode_body_entered(body):
	if body.chasing and !force: return
	body.wait(time)
	body.flip()
