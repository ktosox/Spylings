extends Navigation2D

var stepMarkerScene = preload("res://Experimental/StepMarker.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var lockPath = false

var finalPath = Curve2D.new()

var stepLimit = 3

# Called when the node enters the scene tree for the first time.
func _ready():

	snap_start()
	
	pass # Replace with function body.

func ceneter_from_global(globalPos):
	var localPos = to_local(globalPos)
	return $MoveRangeHiglight.world_to_map(localPos) * $MoveRangeHiglight.cell_size + ($MoveRangeHiglight.cell_size/2)

func get_curve():
	return finalPath
	pass

func update_path():
	$Path.clear_points()
	$StartingPosition.curve.clear_points()

	#$Path.add_point($StartingPosition.global_position)
	for P in get_simple_path($StartingPosition.global_position,ceneter_from_global(get_global_mouse_position())):
		$StartingPosition.curve.add_point(P - $StartingPosition.global_position)
		$Path.add_point(P)
	#$Path.add_point( ceneter_from_global(get_global_mouse_position() - $Path.global_position))
	
	$EndPosition.global_position = $Path.points[$Path.points.size()-1]
	pass

func snap_start():
	$StartingPosition.global_position = ceneter_from_global($StartingPosition.global_position)
	$StartingPosition/PathFollow2D.global_position = $StartingPosition.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !lockPath:
		update_path()
	
	pass

func add_step():
	
	if get_tree().get_nodes_in_group("Step").size() <= stepLimit :
			
		var newStep = stepMarkerScene.instance()
		add_child(newStep)
		for P in get_simple_path($StartingPosition.global_position,ceneter_from_global(get_global_mouse_position())):
			finalPath.add_point(P)
		newStep.global_position = $EndPosition.global_position
		$StartingPosition.global_position = $EndPosition.global_position
		$FinalPath.points = finalPath.get_baked_points()
		pass



func reset_path():
	for S in get_tree().get_nodes_in_group("Step"):
		S.queue_free()
	var startingStep = stepMarkerScene.instance()
	add_child(startingStep)
	$StartingPosition.global_position = finalPath.get_point_position(finalPath.get_point_count()-1)
	startingStep.position = $StartingPosition.position
	finalPath = Curve2D.new()
	snap_start()
	$FinalPath.clear_points()
	pass
