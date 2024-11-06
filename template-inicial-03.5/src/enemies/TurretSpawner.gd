extends Node

@export var TURRET : PackedScene
@export var turret_amount : int = 4

@onready var spawn_areas : Array = [
	$SpawnArea01,
	$SpawnArea02,
	$SpawnArea03,
]

func initialize(projectile_container) -> void:
	for area in spawn_areas:
		for i in area.amount:
			var turret = TURRET.instantiate()
			add_child(turret)
			turret.initialize(area.random_point(), projectile_container)
