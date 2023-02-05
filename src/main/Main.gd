extends Node

var inMiniGame = false
	
func exitMini():
	for member in get_tree().get_nodes_in_group("pausedWhenMini"):
		member.unpause()

func enterMini():
	if inMiniGame: return
	for member in get_tree().get_nodes_in_group("pausedWhenMini"):
		member.pause()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FlipNode_body_entered(body):
	print(body)
	body.flip()


func _on_TimerNode_body_entered(body):
	print(body)
	body.wait(4)
