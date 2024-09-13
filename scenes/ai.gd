extends StaticBody2D

var ball_pos : Vector2
var vert_distance_to_ball : int
var move_by : float
var win_height : int
var p_height : int
var difficulty_speed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	difficulty_speed = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_pos = $"../Ball".position
	vert_distance_to_ball = position.y - ball_pos.y
	
	move_by = (get_parent().PADDLE_SPEED - difficulty_speed) * delta * sign(vert_distance_to_ball)
	print(move_by)
	
	position.y -= move_by
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
