extends Area2D


signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector2(3, 0)


func _on_Star_body_entered(body):
	print(body.filename)
	if body.is_in_group("rocks"):
		queue_free()
	emit_signal("hit")
