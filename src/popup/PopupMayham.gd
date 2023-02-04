extends Node2D

export(PackedScene) var popup_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var popupCount
var winstate = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()

func game_over():
	$PopupTimer.stop()

func new_game():
	screenSize = $Screen/Sprite.get_rect().size
	for _i in range(6): createPopup()
	$PopupTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	popupCount = get_tree().get_nodes_in_group("popups").size()
	
	if popupCount == 0:
		winstate = 1
		$WinLossCanvas/WinLoss.text = "viiner"
	if popupCount > 15:
		winstate = -1
		$WinLossCanvas/WinLoss.text = "loose"
		

func _on_PopupTimer_timeout():
	if winstate==0:
		createPopup()

func createPopup():
	# Create a new instance of the popup scene.
	var popup = popup_scene.instance()

	# Set the popup's position to a random location.
	popup.position = Vector2(screenSize.x*rand_range(-2,2), screenSize.y*rand_range(-5,5))

	# Spawn the popup by adding it to the Main scene.
	add_child(popup)
