extends Node

@export var turret_amount = 4

const TURRET = preload("res://enemies/turret.tscn")

func initialize(set_target, projectile_container):
	var screen : Rect2 = get_viewport().get_visible_rect()
	for i in turret_amount:
		var turret = TURRET.instantiate()
		var pos_x = randf_range(1000, 2500)
		var pos_y = randf_range(-250, 500)
		turret.initialize(set_target, Vector2(pos_x, pos_y), projectile_container)
		add_child(turret)
