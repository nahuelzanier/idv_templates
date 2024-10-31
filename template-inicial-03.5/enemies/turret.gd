extends CharacterBody2D

@onready var weapon_holder = $WeaponHolder
@onready var ray_cast = $RayCast2D

var target = null

func initialize(initial_position, projectile_container):
	global_position = initial_position
	weapon_holder.initialize(projectile_container)

func _physics_process(delta):
	if target:
		weapon_holder.look_at(target.global_position)
		ray_cast.rotation = ray_cast.global_position.direction_to(target.global_position).angle()-PI/2
		shoot()

func shoot():
	if ray_cast.get_collider() and ray_cast.get_collider().is_in_group("PLAYER"):
		weapon_holder.activate_weapon()

func notify_hit(bullet):
	print("TURRET HIT!!")
	bullet.call_deferred("queue_free")

func _on_area_2d_body_entered(body):
	target = body
	shoot()

func _on_area_2d_body_exited(body):
	target = null #no chequeamos porque porque el unico que esta en el layer 3 es el player
