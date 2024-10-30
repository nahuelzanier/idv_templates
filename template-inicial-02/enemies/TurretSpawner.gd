extends Node

const TURRET = preload("res://enemies/turret.tscn")

func initialize(set_target, projectile_container):
	var screen : Rect2 = get_viewport().get_visible_rect()
	for i in 4:
		var turret = TURRET.instantiate()
		var pos_x = randf_range(screen.position.x, screen.end.x)
		var pos_y = randf_range(screen.position.y, screen.end.y - 200)
		turret.initialize(set_target, Vector2(pos_x, pos_y), projectile_container)
		add_child(turret)
