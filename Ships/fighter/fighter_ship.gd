extends BaseShip

@onready var weapon := $Weapons
@onready var shield := $Shield

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func shoot() -> void:
	weapon.call("shoot")
	pass

func use_shield() -> void:
	shield.call("activate_shield")
	pass
	
func destroy() -> void:
	pass
