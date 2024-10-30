extends Sprite2D

@export var VELOCITY : float = 400.0

var direction : Vector2 = Vector2.ZERO

func initialize(origin, weapon_tip):
	# direccion y posicion inicial del proyectil
	global_position = origin
	direction = origin.direction_to(weapon_tip)

func _process(delta):
	# movimiento del proyectil
	position += direction * VELOCITY * delta

func _on_despawn_timer_timeout():
	queue_free()
