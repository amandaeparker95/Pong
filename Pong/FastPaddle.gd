extends Sprite

var collect = false


func _on_Area2D_body_entered(body):
	if body.get("TYPE") == "LPaddle" && collect == false:
		collect = true
		body.speed = 550
		$anim.play("collect")
		$Timer.start()



func _on_Timer_timeout():
	get_parent().get_node("LPaddle").speed = 450
	get_tree().queue_free()
