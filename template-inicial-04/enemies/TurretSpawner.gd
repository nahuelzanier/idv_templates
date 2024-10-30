extends Node

const TURRET = preload("res://enemies/turret.tscn")

@export var turret_amount = 4

@onready var spawn_areas = [
	$SpawnArea01,
	$SpawnArea02,
	$SpawnArea03,
]

func initialize(projectile_container):
	for area in spawn_areas:
		for i in area.amount:
			var turret = TURRET.instantiate()
			add_child(turret)
			turret.initialize(area.random_point(), projectile_container)
