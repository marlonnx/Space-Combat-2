extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	top_level=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 200 * delta;
	
	if position.y < -500:
		queue_free()
