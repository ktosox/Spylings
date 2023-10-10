extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var waitTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func show_options():
	$Options.visible = true
	$Label.visible = true
	pass

func hide_options():
	$Options.visible = false
	if waitTime == 0:
		$Label.visible = false
	pass





func _on_ClickDetector_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("RMB"):
		show_options()
		pass
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	waitTime = value
	$Label.text = String(value)
	pass # Replace with function body.


func _on_Deselection_mouse_entered():
	hide_options()
	pass # Replace with function body.
