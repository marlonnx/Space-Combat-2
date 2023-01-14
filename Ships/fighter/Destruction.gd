extends Node2D

@onready var sprite := $Sprite2D
@onready var animationPlayer := $AnimationPlayer
@onready var sfx := $ExplosionSFX

# Called when the node enters the scene tree for the first time.
signal destruction_completed

func _ready():
	sprite.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func destroy():
	sprite.visible = true;
	animationPlayer.play("Destruction")
	sfx.play()
	await animationPlayer.animation_finished
	emit_signal("destruction_completed")
	
