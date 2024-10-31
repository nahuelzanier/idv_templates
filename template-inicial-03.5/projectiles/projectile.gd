extends Area2D

@export var VELOCITY : float = 200.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

var origin_weapon
var direction : Vector2 = Vector2.ZERO

func initialize(weapon):
	origin_weapon = weapon
	global_position = weapon.weapon_tip.global_position

func _ready():
	animated_sprite_2d.play("fire_start")
	collision_shape_2d.disabled = true

func _process(delta):
	if animated_sprite_2d.animation == "fire_start":
		global_position = origin_weapon.weapon_tip.global_position
	if animated_sprite_2d.animation == "traveling":
		position += direction * VELOCITY * delta

func _on_despawn_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit(self)

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "fire_start":
		rotation = (origin_weapon.weapon_tip.global_position - origin_weapon.global_position).angle()
		direction = origin_weapon.global_position.direction_to(origin_weapon.weapon_tip.global_position)
		animated_sprite_2d.play("traveling")
		collision_shape_2d.disabled = false
