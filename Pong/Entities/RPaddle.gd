extends KinematicBody2D

var speed = 450
onready var is_cpu = global.bot
var velocity 
var ball 

func _ready():
	if is_cpu:
		speed = 350

func _physics_process(delta):
	position.x = 1030
	if is_cpu:
		move_and_slide(Vector2(0, get_p2_dir()*speed))
	else:
		velocity = Vector2.ZERO
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		velocity.x = 0
		move_and_slide(velocity*speed)

func get_p2_dir():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else: 
		return 0




