extends Node2D	

func _on_OKButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		# End condition
		print("game win")
