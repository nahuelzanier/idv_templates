extends Node2D

@export var current_weapon : Node2D
var projectile_container

func initialize(container):
	projectile_container = container

func activate_weapon():
	if current_weapon.fire_ready:
		current_weapon.fire_ready = false
		current_weapon.attack_speed.start()
		var projectile = current_weapon.PROJECTILE.instantiate()
		projectile_container.call_deferred("add_child", projectile)
		projectile.initialize(current_weapon)

func _process(delta):
	current_weapon.adjust_position()
