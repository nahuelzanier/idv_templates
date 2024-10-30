extends CharacterBody2D

@onready var weapon = $Weapon

@export var JUMP : float = 600
@export var MAX_SPEED : float = 400
@export var ACCELERATION : float = 20
@export var FRICTION : float = 0.1
@export var GRAVITY : float = 15.0

func _ready():
	add_to_group("PLAYER")

func initialize(projectile_container):
	weapon.initialize(projectile_container)

func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y -= JUMP

func _physics_process(delta):
	velocity.y += GRAVITY
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = clamp(velocity.x + (ACCELERATION * direction), -MAX_SPEED, MAX_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	move_and_slide()

func notify_hit(bullet):
	print("PLAYER DAMAGE...")
	bullet.call_deferred("queue_free")
