extends Node2D

export(int) var TEXTURE_VARIATIONS_AMOUNT: int = 3
export(int) var TEXTURE_WIDTH: int = 57

onready var brick = preload("res://breakout/Brick.tscn")

func set_bricks():
	for y in range (3):
		for x in range(10):
			var brick_instance = brick.instance()
			brick_instance.position=Vector2(100+90*x, 70+60*y)
			
			if y==1 && x==4:
				brick_instance.get_child(0).region_rect.position.x = 1 + TEXTURE_VARIATIONS_AMOUNT * TEXTURE_WIDTH
				brick_instance.makeImportant()
			else:
				var skips: int = randi() % TEXTURE_VARIATIONS_AMOUNT
				brick_instance.get_child(0).region_rect.position.x = 1+ skips * TEXTURE_WIDTH

			add_child(brick_instance)

func _ready():
	set_bricks()
