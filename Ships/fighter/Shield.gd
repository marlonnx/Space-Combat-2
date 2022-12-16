extends Node2D

@onready var timer := $ShieldDurationTimer
@onready var colddownTimer := $ColdDownTimer
@onready var animated_sprite:= $AnimatedSprite2D

signal shield_active
signal shield_disabled
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",deactivate_shield)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate_shield() -> void:
	if timer.is_stopped() and colddownTimer.is_stopped():
		visible = true
		animated_sprite.play("Shield")
		timer.start()
		emit_signal("shield_active")

func deactivate_shield():
	visible = false
	colddownTimer.start();
	animated_sprite.stop()
	emit_signal("shield_disabled")
