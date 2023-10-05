extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if drag:
		global_position = get_global_mouse_position()
	pass



func _on_DebugPlayer_input_event(viewport, event:InputEvent, shape_idx):
	if event.is_class("InputEventMouseButton"):
		if event.is_pressed():
			drag = true
		else:
			drag = false
			
	pass # Replace with function body.
