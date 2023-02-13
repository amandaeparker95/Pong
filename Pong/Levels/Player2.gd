extends Node

var id = global.p2_id
var is_cpu = global.bot

func _ready():
	reset()
	$Paddle.is_cpu = is_cpu
	$Paddle.ball = get_parent().find_node("Ball")
	
func reset():
	$Avatar.frame = id
	$Paddle/GroundUnit/AnimatedSprite.frame = 2*id

func strike():
	$Avatar.frame = id+10

func hit():
	$Avatar.frame = id+20
	$Paddle/GroundUnit/AnimatedSprite.frame = 2*id+1
	$Fire.ignite()
	$Fire2.ignite()
	
func win():
	$Avatar.frame = id+30
	$Paddle.speed = 0
	$Paddle.visible = false

func lose():
	$Avatar.frame = id+40
	$Paddle.visible = false
	$Paddle/GroundUnit/AnimatedSprite.frame = 2*id+1
	$Fire.ignite()
	$Fire2.ignite()

func changeID(i):
	id = i
