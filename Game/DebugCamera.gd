extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	var moveDir = Vector2.ZERO
	moveDir.x -= int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"))
	moveDir.y -= int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	
	global_position += moveDir.normalized() * delta * 600
	pass
