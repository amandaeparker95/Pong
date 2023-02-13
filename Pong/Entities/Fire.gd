extends ColorRect

var r = 243.0
var g = 142.0
var b = 12.0
var a = 0.0

func _ready():
	color = Color(.95, .56, .05, 250)

func _process(delta):
	if $Timer.time_left > 3.90:
		a = 200.0
	elif $Timer.time_left > 3.85:
		a = 150.0
	elif $Timer.time_left > 3.80:
		a = 100.0
	elif $Timer.time_left > 3.75:
		a = 50
	else:
		a = 5
	
	color = Color(.95, .56, .05, a/256)
	
func ignite():
	$Timer.start()
	a = 50.0
	pass


func _on_Timer_timeout():
	a = 0.0
	pass # Replace with function body.
