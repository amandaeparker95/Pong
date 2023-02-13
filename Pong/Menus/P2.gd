extends Node

onready var face = $Face
onready var circle = $Circle/AnimatedSprite
var is_bot = false

func update(i):
	face.frame = i
	circle.frame = 2*i
	$Label.text = global.p2_name
	
func updateBot(b):
	is_bot = b
