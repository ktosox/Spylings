extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Control_gui_input(event:InputEvent):
	if event.is_pressed() and event.is_class("InputEventMouseButton"):
		$"../PathPreview".add_step()
	pass # Replace with function body.
