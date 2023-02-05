extends KinematicBody2D

export var speed = 4
var hiding = false
var inMiniGame = false

onready var breakout = preload("res://breakout/Breakout.tscn")
onready var popup = preload("res://popup/PopupMayham.tscn")
onready var valvespin = preload("res://valvespin/ValveSpin.tscn")
onready var shooter = preload("res://shooter/Shooter.tscn")

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
		$AudioStreamPlayer2D.volume_db = -6
	
	elif Input.is_action_pressed("ui_left"):
		unhide()
		move_and_collide(Vector2(-speed,0))
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
		$AudioStreamPlayer2D.volume_db = -6
		
	else:
		$AnimatedSprite.animation = "stand"
		$AudioStreamPlayer2D.volume_db = -90
		
func unhide():
	if hiding:
		$CollisionShape2D.disabled = false
		modulate = Color(1,1,1,1)
		hiding = false

func hide():
	if !hiding:
		$AnimatedSprite.animation = "stand"
		$AudioStreamPlayer2D.volume_db = -90
		$HideTimeout.start()
		move_and_collide(Vector2(0,0))
		modulate = Color(0.5,0.5,0.5,1)
		$CollisionShape2D.disabled = true
		hiding = true

func pause():
	$AnimatedSprite.animation = "stand"
	$AudioStreamPlayer2D.volume_db = -90
	inMiniGame = true
	
func unpause():
	inMiniGame = false

func startMini(game):
	if inMiniGame: return
	$"../../Level".enterMini()
	var cameraPosition = $"../Player/Camera2D".get_camera_position()

	match game:
		"breakout":	
			var breakout_instance = breakout.instance()
			breakout_instance.position=Vector2(cameraPosition.x-700, cameraPosition.y-300)
			get_parent().add_child(breakout_instance)
		"popup":
			var popup_instance = popup.instance()
			popup_instance.position=Vector2(cameraPosition.x-450, cameraPosition.y-400)
			get_parent().add_child(popup_instance)
		"valvespin":
			var valvespin_instance = valvespin.instance()
			valvespin_instance.position=Vector2(cameraPosition.x-400, cameraPosition.y-300)
			get_parent().add_child(valvespin_instance)
		"shooter":
			var shooter_instance = shooter.instance()
			shooter_instance.position=Vector2(cameraPosition.x-400, cameraPosition.y-400)
			get_parent().add_child(shooter_instance)
