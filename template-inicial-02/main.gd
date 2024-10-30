extends Node

@onready var projectile_container = $ProjectileContainer
@onready var turret_spawner = $TurretSpawner
@onready var player = $Player

func _ready():
	# inicializa el player pasandole el projectile container
	# el player se lo va a pasar al cannon y el cannon conecta la signal
	# inicializa el turret spawner con el player como target
	player.initialize(projectile_container)
	turret_spawner.initialize(player, projectile_container)
