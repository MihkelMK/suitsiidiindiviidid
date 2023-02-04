extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_grab = false
var grabbed_offset = Vector2()
var arr = Array()
export var jarjekord = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Prgitkk_mouse_entered():
	print("Hiir kohal")
	#print(jarjekord)
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:

		position = get_global_mouse_position() + grabbed_offset
		
