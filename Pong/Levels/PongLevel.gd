extends Node

var p1_lives = global.p1_lives
var p1_name = global.p1_name
var p2_lives = global.p2_lives
var p2_name = global.p2_name
var pause = false
var game_end = false

func _process(delta):
	if $CooldownLabel.visible:
		$CooldownLabel.text = str(int($CooldownTimer.time_left)+1)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if game_end:
		global.p1_lives = 5
		global.p2_lives = 5
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://Menus/Main.tscn")

func _ready():
	game_end = false
	$Player1/Name.text = p1_name
	$Player2/Name.text = p2_name
	$Player1/Lives.text = "Lives: " + str(p1_lives)
	$Player2/Lives.text = "Lives: " + str(p2_lives)
	reset()
	$CooldownLabel.visible = true
	
func _on_P1_Zone_body_entered(body):
	$BGM.stop()
	$Ignite.play()
	p1_lives -= 1
	if p1_lives == 0: 
		stop()
		$Player2/Lives.text = "Win!"
		$Player2.win()
		$Player1/Lives.text = "Lose!"
		$Player1.lose()
		game_end = true
	else:
		$CooldownLabel.visible = true
		$Player1.hit()
		$Player2.strike()
		$Player1/Lives.text = "Lives: " + str(p1_lives)
		reset()
	pass # Replace with function body.

func _on_P2_Zone_body_entered(body):
	$BGM.stop()
	$Ignite.play()
	p2_lives -= 1
	if p2_lives == 0:
		stop()
		$Player1/Lives.text = "Win!"
		$Player1.win()
		$Player2/Lives.text = "Lose!"
		$Player2.lose()
		game_end = true
	else:
		$CooldownLabel.visible = true
		$Player2.hit()
		$Player1.strike()
		$Player2/Lives.text = "Lives: " + str(p2_lives)
		reset()

func reset():
	$Ball.position = Vector2(640, 472.5)
	$Ball.speed = 250
	$Player1/Paddle.position = Vector2(250, 472.5)
	$Player2/Paddle.position = Vector2(1030, 472.5)
	$Player1/Paddle/GroundUnit.position = Vector2(125, 0)
	$Player2/Paddle/GroundUnit.position = Vector2(-125, 0)
	get_tree().call_group("StopGroup", "freeze")
	$CooldownTimer.start()

func stop():
	get_tree().call_group("StopGroup", "freeze")
	$Ball.visible = false
	$Ball.speed = 0
	$Player1/Paddle.speed = 0
	$Player2/Paddle.speed = 0
	
func change_ball_speed(i):
	$Ball.speed = i
	pass
	

func _on_Cooldown_timeout():
	get_tree().call_group("StopGroup", "melt")
	$CooldownLabel.visible = false
	$BGM.play()
	$Player1.reset()
	$Player2.reset()
