extends Area2D


signal collected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector2(3, 0)


func _on_Star_body_entered(body):
	if body.is_in_group("rocks"):
		queue_free()
	else:
		emit_signal("collected")
		$CollisionShape2D.set_deferred("disabled", true) # so that we don't trigger the signal more than once
		queue_free()
