extends Node2D


@export var Bullet:PackedScene
#@onready var timer := $CooldownTimer
@onready var animation_player := $AnimationPlayer
@onready var sprite :=$Sprite2D
@onready var soundEffect :=$SoundEffect
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func shoot() -> void:
	sprite.visible = true
	animation_player.play("Shoot")
	

	
func shootLeft() -> void:
	var bullet:Node2D = Bullet.instantiate()
	add_child(bullet)
	bullet.position = self.global_position
	bullet.position.x -= 6
	bullet.position.y -= 6
	soundEffect.play()
	
func shootRight() -> void:
	var bullet:Node2D = Bullet.instantiate()
	add_child(bullet)
	bullet.position = self.global_position
	bullet.position.x += 6
	bullet.position.y -= 6
	soundEffect.play()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Shoot":
		sprite.visible = false
	pass # Replace with function body.
