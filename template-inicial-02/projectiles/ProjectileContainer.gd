extends Node

const PROJECTILE = preload("res://projectiles/projectile.tscn")
const PROJECTILE_PLAYER = preload("res://projectiles/projectile_player.tscn")

var projectile_dict = {
	"turret" : PROJECTILE,
	"player_cannon" : PROJECTILE_PLAYER
}

func fire_projectile(cannon, cannon_tip, projectile_type):
	var shot = projectile_dict[projectile_type].instantiate()
	shot.initialize(cannon, cannon_tip)
	add_child(shot)
