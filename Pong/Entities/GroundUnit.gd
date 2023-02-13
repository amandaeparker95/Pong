extends KinematicBody2D

var speed = 450

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right2"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left2"):
		velocity.x -= 1
	
	move_and_slide(velocity*speed)
