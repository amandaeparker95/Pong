extends KinematicBody2D

var speed = 450

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_down2"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up2"):
		velocity.y -= 1
	
	move_and_slide(velocity*speed)
	position.x = 250
