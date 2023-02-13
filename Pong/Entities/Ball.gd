extends KinematicBody2D

var speed = 250
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.75, 0.75][randi() % 2]
	$AnimatedSprite.play()
	
func _physics_process(delta):
	var collide = move_and_collide(velocity * speed * delta)
	if collide:
		$Bonk.play()
		if speed < 700:
			speed += 15
		velocity = velocity.bounce(collide.normal)

func freeze():
	speed = 0

func melt():
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.75, 0.75][randi() % 2]
	speed = 250


