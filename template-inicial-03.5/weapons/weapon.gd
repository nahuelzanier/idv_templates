extends Node2D

@onready var attack_speed = $AttackSpeed
@export var weapon_tip : Marker2D
@export var projectile_type : String
var fire_ready = true

func _on_attack_speed_timeout():
	fire_ready = true
