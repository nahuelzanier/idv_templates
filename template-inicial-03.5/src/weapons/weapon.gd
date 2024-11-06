extends Node2D
class_name Weapon

@onready var attack_speed = $AttackSpeed
@export var PROJECTILE : PackedScene
@export var weapon_tip : Marker2D
var fire_ready = true

func _on_attack_speed_timeout():
	fire_ready = true

func adjust_position(): pass
