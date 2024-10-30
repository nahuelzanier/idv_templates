extends Node2D

@export var current_weapon : Node2D

signal fire_weapon

func initialize(projectile_container):
	# cannon conecta la signal al container
	fire_weapon.connect(projectile_container.fire_projectile)

func activate_weapon():
	if current_weapon.fire_ready:
		# se envia la signal al container al disparar
		current_weapon.fire_ready = false
		current_weapon.attack_speed.start()
		emit_signal("fire_weapon", current_weapon)

func _process(delta):
	look_at(get_global_mouse_position())
