extends Node


export (PackedScene) var Rock
export (PackedScene) var RockDown


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$RockTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RockTimer_timeout():
	var rock = create_rock()
	add_child(rock)


func create_rock():
	var r = randi() % 2
	if r == 0:
		var rock = Rock.instance()
		rock.position = Vector2(rand_range(800, 1400), rand_range(130, 230))
		return rock
	else:
		var rock = RockDown.instance()
		rock.position = Vector2(rand_range(800, 1400), rand_range(0, 100))
		return rock
