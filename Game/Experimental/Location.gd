extends CenterContainer


var pointID = -1

signal press_started (caller)
signal press_ended 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_button_down():
	emit_signal("press_started", self)
	pass # Replace with function body.


func _on_TextureButton_button_up():
	emit_signal("press_ended")
	pass # Replace with function body.
