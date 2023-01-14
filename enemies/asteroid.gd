class_name  Asteroid
extends CharacterBody2D


var EFFECT = preload("res://enemies/explosion.tscn")
@onready var explostionSFX := $Explosion
@onready var sprite := $Sprite2D
@onready var collision := $CollisionShape2D

var isExploding := false
func _physics_process(delta):
	position.y += 100 * delta
	pass

func take_damage(_damage:int) -> void:
	collision.set_deferred("disabled",true)
	if isExploding:
		return
		
	isExploding = true
	explostionSFX.play()
	var explosion = EFFECT.instantiate() as Node2D
	explosion.connect("timeout",queue_free)
	sprite.visible = false
	explosion.position = self.global_position
	add_child(explosion)

	



func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
