extends Node2D


func stopGame():
	$"../../../Main".exitMini()
	queue_free()
