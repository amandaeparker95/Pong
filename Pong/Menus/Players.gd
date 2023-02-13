extends Node

var id1 = global.p1_id
var id2 = global.p2_id
var selected1 = 0
var selected2 = 0

var names = ["rodsha", "vander", "millew", "diana", "yawnoc",
				"conway", "Anaid", "wellim", "rednav", "ashdor"]

func _ready():
	global.p1_name = names[0]
	global.p2_name = names[5]
	$P1.update(id1)
	$P2.update(id2)

func _process(_delta):
	
	if selected1 == 0:

		if Input.is_action_just_pressed("ui_right2"):
			$P1/Cursor2.play()
			if (0 <= id1 && id1 < 4):
				id1 += 1
			else:
				id1 = 0
			global.p1_name = names[id1]
			$P1.update(id1)
			
		if Input.is_action_just_pressed("ui_left2"):
			if (0 < id1 && id1 <= 4):
				id1 -= 1
			else:
				id1 = 4
			$P1/Cursor2.play()
			global.p1_name = names[id1]
			$P1.update(id1)
		if Input.is_action_just_pressed("ui_down2") \
			or Input.is_action_just_pressed("ui_up2"):
			$P1/Cursor2.play()
			$P1/Cursor.position.y += 50
			selected1 = 1

	elif selected1 == 1:
		if Input.is_action_just_pressed("ui_right2"):
			if global.p1_lives < 20:
				$P1/Cursor2.play()
				global.p1_lives += 1
		if Input.is_action_just_pressed("ui_left2"):
			if global.p1_lives > 1:
				$P1/Cursor2.play()
				global.p1_lives -= 1
		if Input.is_action_just_pressed("ui_up2") \
		or Input.is_action_just_pressed("ui_down2"):
			$P1/Cursor2.play()
			$P1/Cursor.position.y -= 50
			selected1 -= 1
		$P1/LabelText.text = "Lives: " + str(global.p1_lives)
	
	if selected2 == 0:
		if Input.is_action_just_pressed("ui_right"):
			$P2/Cursor2.play()
			if (5 <= id2 && id2 < 9):
				id2 += 1
			else:
				id2 = 5
			global.p2_name = names[id2]
			$P2.update(id2)
		if Input.is_action_just_pressed("ui_left"):
			$P2/Cursor2.play()
			if (5 < id2 && id2 <= 9):
				id2 -= 1
			else:
				id2 = 9
			global.p2_name = names[id2]
			$P2.update(id2)
		if Input.is_action_just_pressed("ui_down"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y += 50
			selected2 += 1
			
		if Input.is_action_just_pressed("ui_up"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y += 100
			selected2 += 2
			
	elif selected2 == 1:
		if Input.is_action_just_pressed("ui_right"):
			if global.p2_lives < 20:
				$P2/Cursor2.play()
				global.p2_lives += 1
		if Input.is_action_just_pressed("ui_left"):
			if global.p2_lives > 1:
				$P2/Cursor2.play()
				global.p2_lives -= 1
		if Input.is_action_just_pressed("ui_up"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y -= 50
			selected2 -= 1
		if Input.is_action_just_pressed("ui_down"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y += 50
			selected2 += 1
		$P2/LabelText.text = "Lives: " + str(global.p2_lives)
			
	elif selected2 == 2:
		if Input.is_action_just_pressed("ui_right") \
			or Input.is_action_just_pressed("ui_left"):
			$P2/Cursor2.play()
			global.bot = !global.bot
			if global.bot:
				$P2/IsBot.text = "Bot: On"
			else:
				$P2/IsBot.text = "Bot: Off"
			
		if Input.is_action_just_pressed("ui_up"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y -= 50
			selected2 -= 1
		if Input.is_action_just_pressed("ui_down"):
			$P2/Cursor2.play()
			$P2/Cursor.position.y -= 100
			selected2 -= 2
