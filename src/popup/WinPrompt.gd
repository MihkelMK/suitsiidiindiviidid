extends CanvasLayer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	visible = false

func _on_OKButton_input_event(viewport, event, shape_idx):
	print("eiii")
	if visible and event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("a") 
		queue_free()
