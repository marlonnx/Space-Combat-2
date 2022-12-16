extends CharacterBody2D


@export var speed = 200.0
@export var friction = 1
@export var acceleration = 0.5

@onready var ship:= $FighterShip as BaseShip

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


	
	
func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed,acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO,friction)
		
	if Input.is_action_pressed("shoot"):
		ship.shoot();
		
	if Input.is_action_just_pressed("shield"):
		ship.use_shield();

	move_and_slide()
