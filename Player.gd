extends KinematicBody2D

onready var player_sprite: = $Sprite
export var velocity: = Vector2.ZERO
export var player_speed: = 100

func get_player_input():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

func animation_controller():
	if Input.is_action_pressed("ui_left"):
		player_sprite.play("walk")
		player_sprite.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		player_sprite.play("walk")
		player_sprite.flip_h = true
	elif Input.is_action_pressed("ui_up"):
		player_sprite.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		player_sprite.play("walk_down")
	else:
		player_sprite.play("idle")	

func _physics_process(delta: float) -> void:
	get_player_input()
	animation_controller()
	velocity = move_and_slide(velocity * player_speed)