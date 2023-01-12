extends Node2D

@onready var enemy := preload("res://enemies/asteroid.tscn")
@onready var spawnTimer := $SpawnTimer
var rng = RandomNumberGenerator.new()

func _ready():
	spawnTimer.one_shot = true

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawnTimer.is_stopped():
		spawnTimer.start()
		var x := enemy.instantiate()
		x.position = Vector2(rng.randf_range(25, 500),-10)
		add_child(x)
	pass


func _on_player_player_death():
	get_tree().paused = true

	pass # Replace with function body.
