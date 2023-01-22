extends Area2D

@export var size = Vector2(50,50)
@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.shape.size= size
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity := Vector2.ZERO
	velocity.y = Input.get_axis("move_up","move_down")
	velocity.x = Input.get_axis("move_left","move_right")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x - size.x)
		position.y = clamp(position.y, 0, screen_size.y - size.y)
	

func _draw():
	draw_rect(Rect2(position, size), Color.GREEN)

