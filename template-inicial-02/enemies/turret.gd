extends Sprite2D

var target = null

signal fire_turret_bullet

func initialize(player, initial_position, projectile_container):
	target = player
	position = initial_position
	fire_turret_bullet.connect(projectile_container.fire_projectile)

func _on_shooting_rate_timeout():
	# se envia la signal al container al disparar
	emit_signal("fire_turret_bullet", global_position, target.global_position, "turret")
