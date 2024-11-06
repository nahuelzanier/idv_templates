extends Node

@onready var projectile_container : Node2D = $Entities/ProjectileContainer
@onready var turret_spawner : Node = $TurretSpawner
@onready var player : CharacterBody2D = $Entities/Player

func _ready() -> void:
	player.initialize(projectile_container)
	turret_spawner.initialize(projectile_container)

func _input(event) -> void:
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
