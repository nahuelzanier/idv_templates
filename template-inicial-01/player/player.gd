extends Sprite2D

@export var speed : float = 200

func _process(delta):
	# devuelve 1 o -1 segun cual sea el input
	var direction = Input.get_axis("move_left", "move_right")
	position.x += direction * speed * delta
