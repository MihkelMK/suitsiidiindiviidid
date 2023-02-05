extends Area2D

export var time: float
export var force = false

func _on_TimerNode_body_entered(body):
	if body.chasing and !force: return
	body.wait(time)
