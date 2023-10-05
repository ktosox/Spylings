extends Node2D



onready var oldPos = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var moveVector = oldPos - global_position
	
	if moveVector != Vector2.ZERO :
		rotation = moveVector.angle() - PI
	oldPos = global_position
	

	
	pass

func look_ahead():

	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
