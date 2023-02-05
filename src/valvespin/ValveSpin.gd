extends Node2D


func stopGame():
	$"../../Level".exitMini()
	queue_free()
