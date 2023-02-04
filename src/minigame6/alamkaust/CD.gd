#sihiku skript
extends Sprite

var edasi = true


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if rotation_degrees < 90:
		edasi = true
		rotation_degrees = 90
	if rotation_degrees <= 270 and edasi:
		rotation_degrees += 1.5
	else:
		rotation_degrees -= 1.5
		edasi = false
	#print(rotation_degrees)

