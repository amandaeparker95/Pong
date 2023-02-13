extends Node

onready var face = $Face
onready var circle = $Circle/AnimatedSprite

func update(i):
	face.frame = i
	circle.frame = 2*i
	$Label.text = global.p1_name
