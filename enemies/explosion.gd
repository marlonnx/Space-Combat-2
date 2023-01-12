extends GPUParticles2D

signal timeout
# Called when the node enters the scene tree for the first time.
func _ready():
	top_level=true
	one_shot=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	emit_signal("timeout")
	queue_free()
	pass # Replace with function body.
