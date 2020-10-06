extends Node


export (PackedScene) var Rock


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$RockTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RockTimer_timeout():
	var rock = Rock.instance()
	add_child(rock)
	rock.position = Vector2(rand_range(800, 1500), rand_range(130, 230))
