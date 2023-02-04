extends Area2D

export var time: int

func _on_TimerNode_body_entered(body):
	body.wait(time)
