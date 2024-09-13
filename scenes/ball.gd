extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2

func _ready():
	win_size = get_viewport_rect().size

## initializes ball
func new_ball():
	#randomize start position & direction
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_direction()

## random vector direction
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-.9, 0.1)
	return new_dir

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#if ball hits paddle
		if collider == $"../Player" || collider == $"../AI":
			speed += ACCEL
			dir = dir.bounce(collision.get_normal())
		else:
			dir = dir.bounce(collision.get_normal())
