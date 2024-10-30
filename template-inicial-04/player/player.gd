extends CharacterBody2D

@onready var weapon_holder = $WeaponHolder
@onready var sprite_pivot = $SpritePivot
@onready var player_sprite = $SpritePivot/PlayerSprite
@onready var anim_player = $AnimationPlayer
@onready var floor_raycasts = [
	$FloorRayCast/RayCast2D,
	$FloorRayCast/RayCast2D2,
	$FloorRayCast/RayCast2D3,
]

@export var JUMP : float = 400
@export var MAX_SPEED : float = 250
@export var ACCELERATION : float = 15
@export var FRICTION : float = 0.1
@export var GRAVITY : float = 15.0

var move_direction = 0

func _ready():
	add_to_group("PLAYER")

func _input(event):
	if event.is_action_pressed("jump") and on_floor():
		velocity.y -= JUMP

func _physics_process(delta):
	velocity.y += GRAVITY
	if move_direction != 0:
		velocity.x = clamp(velocity.x + (ACCELERATION * move_direction), -MAX_SPEED, MAX_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	move_and_slide()

func initialize(projectile_container):
	weapon_holder.initialize(projectile_container)

func notify_hit(bullet):
	print("PLAYER DAMAGE...")
	bullet.call_deferred("queue_free")

func play_animation(animation):
	anim_player.play(animation)

func set_move_direction(value : int):
	move_direction = value
	if value != 0:
		sprite_pivot.scale.x = value

func activate_weapon():
	weapon_holder.activate_weapon()

func on_floor() -> bool:
	var on_floor = is_on_floor()
	for ray in floor_raycasts:
		ray.force_raycast_update()
		on_floor = on_floor or ray.get_collider()
	return on_floor
