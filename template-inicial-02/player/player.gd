extends Sprite2D

@onready var cannon = $Cannon

@export var MAX_SPEED : float = 80.0
@export var ACCELERATION : float = 8.0
@export var FRICTION : float = 0.1

var velocity = Vector2.ZERO

func initialize(projectile_container):
	# se pasa la referencia al cannon
	cannon.initialize(projectile_container)

func _process(delta):
	# Movimiento del player con aceleracion
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		# clamp(x, a, b) mantiene el valor x entre los valores a min y b max
		velocity.x = clamp(velocity.x + (ACCELERATION * direction), -MAX_SPEED, MAX_SPEED)
	else:
		# cambio gradual hasta llegar al valor 0.0, linear interpolation
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	position.x += velocity.x * ACCELERATION * delta
