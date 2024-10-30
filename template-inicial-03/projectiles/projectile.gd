extends Area2D

@export var VELOCITY : float = 400.0

var direction : Vector2 = Vector2.ZERO

func initialize(origin, weapon_tip):
	global_position = origin
	direction = origin.direction_to(weapon_tip)

func _process(delta):
	position += direction * VELOCITY * delta

func _on_despawn_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit(self)
