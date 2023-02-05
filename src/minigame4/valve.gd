extends Sprite

var playerforce = 0.2
var winnerkriteerium = 3
var valverotatespeed = 1
var circlecounter = 1337
var input_enabled = true

func _process(delta):
	if input_enabled == true:
		circlecounter = floor(rotation_degrees / 360)
		# print("hetkel on tehtud " + str(circlecounter) + " ringi.")
		if circlecounter == winnerkriteerium:
			rotation = 0
			input_enabled = false
			$Label.text = "Task completed!"
		if circlecounter >= 0:
			rotation-=valverotatespeed*delta
		
		if Input.is_action_just_pressed("ui_right"):
			rotation += playerforce
			#print(rotation_degrees)
		if Input.is_action_just_pressed("ui_left"):
			rotation += playerforce
			#print(rotation_degrees)
	elif input_enabled == false:
		pass

#func _input(ev):
#	if ev is InputEventKey and (ev.scancode == KEY_RIGHT or ev.scancode == KEY_LEFT):
#		rotation+=playerforce
#		#print(rotation_degrees)


# kümneni paigutus paika ehk mitu tiiru vaja teha
# kas pöörlemiskiirus on progresseeruv või mitte ?
# kas jõud on vähenev ?
