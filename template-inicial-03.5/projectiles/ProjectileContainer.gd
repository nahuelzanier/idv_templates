extends Node

const PROJECTILE_ENEMY = preload("res://projectiles/projectile_enemy.tscn")
const PROJECTILE_PLAYER_WAND = preload("res://projectiles/projectile_player.tscn")

var projectile_dict = {
	"turret" : PROJECTILE_ENEMY,
	"player_wand" : PROJECTILE_PLAYER_WAND
}

func fire_projectile(weapon):
	var shot = projectile_dict[weapon.projectile_type].instantiate()
	call_deferred("add_child", shot)
	shot.initialize(weapon)
