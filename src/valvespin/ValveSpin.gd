extends Node2D


func stopGame(win):
	$"../../Level".exitMini(win)
	queue_free()
