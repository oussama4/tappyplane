extends KinematicBody2D

var speed = 50
var velocity = Vector2()
signal crashed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func process_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		speed = 200
	else:
		velocity.y += 1
		speed = 50
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	process_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		emit_signal("crashed")
		$CollisionShape2D.set_deferred("disabled", true)
