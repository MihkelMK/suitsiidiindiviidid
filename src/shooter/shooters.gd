extends Node2D

export(int) var TEXTURE_VARIATIONS_AMOUNT: int = 3
export(int) var TEXTURE_WIDTH: int = 57
var boatCount: int
var brickCountY: int = 2
var brickCountX: int = 5

var importantBrickY: int = 0
var importantBrickX: int = 0
onready var brick = preload("res://shooter/LendavElement.tscn")

func set_bricks():
	for y in range(brickCountY):
		for x in range(brickCountX):
			var brick_instance = brick.instance()
			var rng = RandomNumberGenerator.new()

			brick_instance.position=Vector2(400+100*x,220+160*y)
			if y==importantBrickY && x==importantBrickX:
				brick_instance.get_child(0).region_rect.position.x = TEXTURE_VARIATIONS_AMOUNT * TEXTURE_WIDTH
				brick_instance.makeImportant()
			else:
				var skips: int = randi() % TEXTURE_VARIATIONS_AMOUNT
				brick_instance.get_child(0).region_rect.position.x = skips * TEXTURE_WIDTH

			add_child(brick_instance)

func _ready():
	add_to_group("minigame")
	randomize()
	importantBrickY = rand_range(0,brickCountY-1)
	importantBrickX = rand_range(1,brickCountX-1)
	set_bricks()

func stopGame():
	$Ball.stopMovement()
	$Paddle.stopMovement()
	
func _physics_process(delta):
	position += Vector2.ZERO * delta
	boatCount = get_tree().get_nodes_in_group("boats").size()
	
	if boatCount == 0:
		$"../../Level".exitMini(true)
		queue_free()
