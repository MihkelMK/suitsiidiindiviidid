extends Node2D

export(PackedScene) var popup_scene
export(PackedScene) var hack_popup_scene

var popupCount
var winstate = 0
var pregeneratedPopups = 8

onready var screenSize = $Screen/Sprite.get_rect().size
onready var viewSize = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()

func game_over():
	$PopupTimer.stop()

func new_game():
	for _i in range(pregeneratedPopups): createPopup()
	$PopupTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	popupCount = get_tree().get_nodes_in_group("popups").size()
	
	if popupCount == 0:
		winstate = 1
		createHackPopup()
	if popupCount > 15:
		winstate = -1
		

func _on_PopupTimer_timeout():
	if winstate==0:
		createPopup()

func createPopup():
	# Create a new instance of the popup scene.
	var popup = popup_scene.instance()

	# Set the popup's position to a random location.
	popup.position = Vector2(viewSize.x/2 + screenSize.x*rand_range(-1,1), viewSize.y/2 + screenSize.y*rand_range(-1.4,1))

	# Spawn the popup by adding it to the Main scene.
	add_child(popup)
	
func createHackPopup():
		# Create a new instance of the popup scene.
	var popup = hack_popup_scene.instance()

	# Set the popup's position to a random location.
	popup.position = Vector2(viewSize.x/2, viewSize.y/2)

	# Spawn the popup by adding it to the Main scene.
	add_child(popup)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		var objects_clicked = get_world_2d().direct_space_state.intersect_point(event.position, 32, [], 0x7FFFFFFF, true, true )
		if objects_clicked.size() > 0:
			var clicked = get_topmost_object(objects_clicked)
			if !("Screen" in clicked.name): clicked.queue_free()

func get_topmost_object(objects_list):
	for i in range(0, objects_list.size()):
		objects_list[i] = objects_list[i].collider.get_parent().get_position_in_parent()

	return get_child(objects_list.max())
