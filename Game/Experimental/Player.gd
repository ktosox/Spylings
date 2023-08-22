extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var oldPos = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	global_position = get_global_mouse_position()
	
	var moveVector = oldPos - global_position
	oldPos = global_position
	if sign(moveVector.x) == -1:
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1
			
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
