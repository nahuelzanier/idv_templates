extends Sprite2D

@onready var weapon_tip = $WeaponTip

signal fire_player_cannon

func initialize(projectile_container):
	# cannon conecta la signal al container
	fire_player_cannon.connect(projectile_container.fire_projectile)

func _input(event):
	if event.is_action_pressed("fire_cannon"):
		# se envia la signal al container al disparar
		emit_signal("fire_player_cannon", global_position, weapon_tip.global_position, "player_cannon")

func _process(delta):
	look_at(get_global_mouse_position())
