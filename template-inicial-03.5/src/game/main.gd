extends Node

@onready var projectile_container = $Entities/ProjectileContainer
@onready var turret_spawner = $TurretSpawner
@onready var player = $Entities/Player

func _ready():
	player.initialize(projectile_container)
	turret_spawner.initialize(projectile_container)

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
