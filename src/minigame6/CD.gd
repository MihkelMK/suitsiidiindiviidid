extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var edasi = true


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if rotation_degrees >= 0 and rotation_degrees < 90 and edasi:
		rotation_degrees += 2
		
	else:
		rotation_degrees -= 2
		edasi = false
	print(rotation_degrees)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
