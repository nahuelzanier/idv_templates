extends StaticBody2D

@onready var shooting_rate = $ShootingRate
@onready var ray_cast = $RayCast2D

var target = null

signal fire_turret_bullet

func initialize(player, initial_position, projectile_container):
	position = initial_position
	fire_turret_bullet.connect(projectile_container.fire_projectile)

func _physics_process(delta):
	if target:
		ray_cast.rotation = ray_cast.global_position.direction_to(target.global_position).angle()-PI/2

func shoot():
	if ray_cast.get_collider() and ray_cast.get_collider().is_in_group("PLAYER"):
		emit_signal("fire_turret_bullet", ray_cast.global_position, target.global_position, "turret")
	shooting_rate.start()

func notify_hit(bullet):
	print("TURRET HIT!!")
	bullet.call_deferred("queue_free")

func _on_shooting_rate_timeout():
	if target:
		shoot()

func _on_area_2d_body_entered(body):
	target = body
	shoot()

func _on_area_2d_body_exited(body):
	target = null #no chequeamos porque porque el unico que esta en el layer 3 es el player
