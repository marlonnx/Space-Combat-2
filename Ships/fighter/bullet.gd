extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var impactDetector := $ImpactDetector
@onready var timer := $Timer
@export var speed := 450
@export var lifetime := 3


func _ready():
	top_level=true
	impactDetector.connect("body_entered",_on_impact)
	timer.connect("timeout",queue_free)
	timer.start(lifetime)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta;


func _on_impact(_body:Node) -> void:
	queue_free()
