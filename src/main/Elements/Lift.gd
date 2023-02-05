extends Area2D

export var goesToPath: NodePath
var atLift = false

onready var goesToNode = get_node(goesToPath)
onready var master_sound = AudioServer.get_bus_index("Master")

func _process(delta):
	if !$MoveTimeout.is_stopped(): return

	if atLift and Input.is_key_pressed(KEY_E):
		if "12" in goesToNode.name: 
			$explosion.play()
			$"../Player/Sprite".visible = true
			$"../../Level".enterMini()
			$ExplosionTimer.start()
			
		goesToNode.get_child(0).animation = "opening"
		$"../Player".position.x = get_position().x
		$MoveTimeout.start()
		$"../Player".goHide(false)
		
func _on_Lift_body_entered(body):
	$AnimatedSprite.animation = "opening"
	$AudioStreamPlayer.play()
	atLift = true

func _on_Lift_body_exited(body):
	$AnimatedSprite.animation = "closing"
	atLift = false

func _on_MoveTimeout_timeout():
	$"../Player".position.y = goesToNode.get_position().y + 8
	
func _on_ExplosionTimer_timeout():
	AudioServer.set_bus_mute(master_sound, true)
