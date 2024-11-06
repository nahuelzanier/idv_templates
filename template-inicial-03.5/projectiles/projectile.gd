extends Area2D
class_name Projectile

@export var VELOCITY : float = 200.0
@export var anim_node : Node
@onready var collision_shape_2d = $CollisionShape2D

var origin_weapon
var direction : Vector2 = Vector2.ZERO

func initialize(weapon):
	origin_weapon = weapon
	global_position = weapon.weapon_tip.global_position

func _ready():
	anim_node.play("fire_start")
	collision_shape_2d.disabled = true

func _process(delta):
	if anim_node.return_animation() == "fire_start":
		if origin_weapon:
			global_position = origin_weapon.weapon_tip.global_position
			rotation = origin_weapon.global_position.direction_to(origin_weapon.weapon_tip.global_position).angle()
	if anim_node.return_animation() == "traveling":
		position += direction * VELOCITY * delta

func _on_despawn_timer_timeout():
	queue_free()

func _on_collision(collider):
	if collider.has_method("notify_hit"):
		collider.notify_hit(self)

func explode():
	anim_node.play("collision")

func _on_anim_node_animation_finished(animation = "placeholder"):
	if origin_weapon and (anim_node.return_animation() == "fire_start" or animation == "fire_start"):
		direction = origin_weapon.global_position.direction_to(origin_weapon.weapon_tip.global_position)
		rotation = direction.angle()
		anim_node.play("traveling")
		collision_shape_2d.disabled = false
	else:
		queue_free()
