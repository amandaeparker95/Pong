extends Node

var names = ["rodsha", "vander", "millew", "diana", "yawnoc",
				"conway", "Anaid", "wellim", "rednav", "ashdor"]

func _ready():
	global.p1_id = 0
	global.p2_id = 5
	$BGM.play()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$BGM.stop()
		global.p1_id = $Players.id1
		global.p1_name = names[global.p1_id]
		global.p2_id = $Players.id2
		global.p2_name = names[global.p2_id]
		get_tree().change_scene("res://Levels/PongLevel.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("enable_bot"):
		if global.bot:
			$Players/P2/IsBot.text = "Bot Disabled"
			global.bot = false
		else:
			$Players/P2/IsBot.text = "Bot Enabled"
			global.bot = true
