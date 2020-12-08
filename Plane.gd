extends KinematicBody2D

export var jump_speed: = 200
export var gravity: = 50

var velocity: = Vector2()

signal crashed
	

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= jump_speed
	else:
		velocity.y += gravity
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		emit_signal("crashed")
		$CollisionShape2D.set_deferred("disabled", true)
