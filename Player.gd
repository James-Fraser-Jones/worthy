extends KinematicBody2D

var velocity: Vector2 = Vector2.ZERO
var gravity: float = 1000
var speed: float = 500

func get_input():
	var input: Vector2 = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		input.x += 1
	if Input.is_action_pressed('ui_left'):
		input.x -= 1
	return input.normalized()

func _physics_process(delta):
	velocity += get_input() * delta * speed
	velocity += Vector2.DOWN * delta * gravity
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
