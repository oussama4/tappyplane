extends StaticBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector2(3, 0)


func _on_VisibilityNotifier2D_screen_exited():
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()
