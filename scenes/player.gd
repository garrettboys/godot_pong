extends StaticBody2D

@onready var window_height := get_viewport_rect().size.y
@onready var paddle_height = $ColorRect.get_size().y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	if Input.is_action_pressed("down"):
		position.y += get_parent().PADDLE_SPEED * delta
	position.y = clamp(position.y, paddle_height / 2, window_height - paddle_height / 2)
