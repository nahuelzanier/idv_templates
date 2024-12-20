extends CharacterBody2D

@onready var weapon : Weapon = $Wand
@onready var sprite_pivot : Node2D = $SpritePivot
@onready var player_sprite : Sprite2D = $SpritePivot/PlayerSprite
@onready var anim_player : AnimationPlayer = $AnimationPlayer

@export var JUMP : float = 400
@export var MAX_SPEED : float = 250
@export var ACCELERATION : float = 15
@export var FRICTION : float = 0.1
@export var GRAVITY : float = 15.0

var move_direction = 0

func _ready() -> void:
	add_to_group("PLAYER")

func _input(event) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y -= JUMP
	if event.is_action_pressed("fire_cannon"):
		weapon.activate_weapon()

func _physics_process(delta) -> void:
	velocity.y += GRAVITY
	move_direction = Input.get_axis("move_left", "move_right")
	if move_direction != 0:
		sprite_pivot.scale.x = move_direction
		velocity.x = clamp(velocity.x + (ACCELERATION * move_direction), -MAX_SPEED, MAX_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	if is_on_floor():
		if abs(velocity.x) < 30:
			anim_player.play("idle")
		else:
			anim_player.play("walk")
	else:
		if velocity.y < 0: anim_player.play("jump")
		else: anim_player.play("fall")
	move_and_slide()

func initialize(projectile_container) -> void:
	weapon.initialize(projectile_container)

func notify_hit() -> void:
	print("PLAYER DAMAGE...")

func play_animation(animation) -> void:
	anim_player.play(animation)
