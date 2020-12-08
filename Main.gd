extends Node


export (PackedScene) var Rock
export (PackedScene) var RockDown
export (PackedScene) var Star
var screen_size
var score = 0


func _ready():
	screen_size = get_viewport().size
	randomize()
	$RockTimer.start()
	$StarTimer.start()


func _on_RockTimer_timeout():
	var rock = create_rock()
	add_child(rock)


func create_rock():
	var r = randi() % 2
	if r == 0:
		var rock = Rock.instance()
		rock.position = Vector2(rand_range(800, 1300), rand_range(130, 230))
		return rock
	else:
		var rock = RockDown.instance()
		rock.position = Vector2(rand_range(800, 1300), rand_range(0, 100))
		return rock


func _on_StarTimer_timeout():
	var star = Star.instance()
	star.position = Vector2(rand_range(800, 1300), rand_range(100, 300))
	star.connect("collected", self, "_on_star_collected")
	add_child(star)
	
	
func _on_star_collected():
	score += 1000
	$HUD/Score.text = "Score: %d" % score


func _on_Plane_crashed():
	$PauseLayer/PauseScreen.game_over()
