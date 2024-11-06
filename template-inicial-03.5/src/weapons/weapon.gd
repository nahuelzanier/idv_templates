extends Node2D
class_name Weapon

@onready var attack_speed : Timer = $AttackSpeed
@export var PROJECTILE : PackedScene
@export var weapon_tip : Marker2D
var fire_ready : bool = true
var projectile_container : Node2D

func initialize(container) -> void:
	projectile_container = container

func activate_weapon() -> void:
	if fire_ready:
		fire_ready = false
		attack_speed.start()
		var projectile = PROJECTILE.instantiate()
		projectile_container.call_deferred("add_child", projectile)
		projectile.initialize(self)

func _on_attack_speed_timeout() -> void:
	fire_ready = true
