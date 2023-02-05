extends Node

var inMiniGame = false
	
func exitMini():
	for member in get_tree().get_nodes_in_group("pausedWhenMini"):
		member.unpause()

func enterMini():
	if inMiniGame: return
	for member in get_tree().get_nodes_in_group("pausedWhenMini"):
		member.pause()
