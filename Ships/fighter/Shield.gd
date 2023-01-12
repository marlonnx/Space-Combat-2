extends Node2D

@onready var timer := $ShieldDurationTimer
@onready var colddownTimer := $ColdDownTimer
@onready var animated_sprite:= $AnimatedSprite2D
@onready var shield_indicator :=$ShieldIndicator
@onready var audio_player := $AudioStreamPlayer2D

signal shield_active
signal shield_disabled
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",deactivate_shield)
	colddownTimer.connect("timeout",func(): shield_indicator.visible = true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate_shield() -> void:
	if timer.is_stopped() and colddownTimer.is_stopped():
		animated_sprite.visible = true
		shield_indicator.visible = false;
		animated_sprite.play("Shield")
		audio_player.play();
		timer.start()
		emit_signal("shield_active")

func deactivate_shield():
	animated_sprite.visible = false
	colddownTimer.start();
	animated_sprite.stop()
	audio_player.stop()
	emit_signal("shield_disabled")
