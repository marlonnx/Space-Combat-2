extends Node2D

@onready var enemy := preload("res://enemies/asteroid.tscn")
@onready var spawnTimer := $SpawnTimer
@onready var deaht_screen := $DeathScreen

var rng = RandomNumberGenerator.new()

func _ready():
	spawnTimer.one_shot = true

	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawnTimer.is_stopped():
		spawnTimer.start()
		var x := enemy.instantiate()
		x.position = Vector2(rng.randf_range(25, 500),-10)
		add_child(x)
	pass


func _on_player_player_death():
	get_tree().change_scene_to_file("res://death_screen.tscn")
	pass

