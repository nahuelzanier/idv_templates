extends CharacterBody2D

@onready var weapon : Weapon = $TurretWeapon
@onready var ray_cast : RayCast2D = $RayCast2D

var target : Node2D = null

func initialize(initial_position, projectile_container) -> void:
	global_position = initial_position
	weapon.initialize(projectile_container)

func _physics_process(delta) -> void:
	if target:
		weapon.look_at(target.global_position)
		ray_cast.rotation = ray_cast.global_position.direction_to(target.global_position).angle()-PI/2
		shoot()

func shoot() -> void:
	if ray_cast.get_collider() and ray_cast.get_collider().is_in_group("PLAYER"):
		weapon.activate_weapon()

func notify_hit() -> void:
	print("TURRET HIT!!")

func _on_area_2d_body_entered(body) -> void:
	target = body
	shoot()

func _on_area_2d_body_exited(body) -> void:
	target = null #no chequeamos porque porque el unico que esta en el layer 3 es el player
