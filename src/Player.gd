extends KinematicBody2D

export var speed = 4
var hiding = false
var inMiniGame = false

onready var breakout = preload("res://breakout/Breakout.tscn")

func _ready():
	add_to_group("pausedWhenMini")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inMiniGame: return
	if !$HideTimeout.is_stopped(): return
		
	if Input.is_action_pressed("ui_right"):
		unhide()
		move_and_collide(Vector2(speed,0))
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "walk"
	
	elif Input.is_action_pressed("ui_left"):
		unhide()
		move_and_collide(Vector2(-speed,0))
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
		
	else:
		$AnimatedSprite.animation = "stand"
		
func unhide():
	if hiding:
		$CollisionShape2D.disabled = false
		modulate = Color(1,1,1,1)
		hiding = false

func hide():
	if !hiding:
		$AnimatedSprite.animation = "stand"
		$HideTimeout.start()
		move_and_collide(Vector2(0,0))
		modulate = Color(0.5,0.5,0.5,1)
		$CollisionShape2D.disabled = true
		hiding = true

func pause():
	inMiniGame = true
	
func unpause():
	inMiniGame = false

func startMini(game):
	if inMiniGame: return
	$"../../Main".enterMini()

	match game:
		"breakout":	
			var breakout_instance = breakout.instance()
			breakout_instance.position=Vector2(-position.x-65,-position.y)
			add_child(breakout_instance)
		
