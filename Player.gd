class_name Player
extends CharacterBody2D


@export var speed = 200.0
@export var friction = 1
@export var acceleration = 0.5

@onready var ship:= $FighterShip as BaseShip
@onready var collision := $CollisionShape2D
@onready var enemy_detector := $EnemyDetector
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal player_death
	
	
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
		enemy_detector.set_deferred("monitoring",false)
		collision.set_deferred("disabled",true)
		await  ship.shield_disabled
		enemy_detector.set_deferred("monitoring",true)
		collision.set_deferred("disabled",false)
	move_and_slide()



func _on_enemy_detector_body_entered(body:Node2D):
	if body is Asteroid:
		collision.set_deferred("disabled",true)

		ship.call("destroy")
		pass # Replace with function body.


func _on_fighter_ship_destruction_completed():
	emit_signal("player_death")
	pass # Replace with function body.
