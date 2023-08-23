extends Node2D

var locationScene = preload("res://Experimental/Location.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pointIDTracker = 1

var dragging = false

var draggedLocation = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_pressed() and event.is_class("InputEventMouseButton"):
		add_location(get_global_mouse_position())
		$Path2D/PathFollow2D/AnimationPlayer.playback_speed = 1300/$Path2D.curve.get_baked_length()
		$Path2D/PathFollow2D/AnimationPlayer.stop()
		$Path2D/PathFollow2D/AnimationPlayer.play("New Anim")

func add_location(where:Vector2):
	var newLocation = locationScene.instance()
	newLocation.rect_global_position = where
	newLocation.pointID = pointIDTracker
	pointIDTracker += 1
	newLocation.connect("press_started",self,"move_point")
	newLocation.connect("press_ended",self,"move_stopped")
	$Path2D.curve.add_point(newLocation.rect_position)
	add_child(newLocation)

	pass

func update_line():
	$Line2D.points = $Path2D.curve.get_baked_points()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_line()
	if dragging:
		draggedLocation.rect_global_position = get_global_mouse_position()
		$Path2D.curve.set_point_position(draggedLocation.pointID, get_global_mouse_position())
		pass
	pass

func move_point(location):
	draggedLocation = location
	dragging = true
	pass

func move_stopped():
	dragging = false
	pass
