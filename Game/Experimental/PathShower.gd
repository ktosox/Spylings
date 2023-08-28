extends Navigation2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lockPath = false

var finalPath = Curve2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():

	snap_start()
	
	pass # Replace with function body.

func ceneter_from_global(globalPos):
	var localPos = to_local(globalPos)
	return $MoveRangeHiglight.world_to_map(localPos) * $MoveRangeHiglight.cell_size + ($MoveRangeHiglight.cell_size/2)

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
	var newStep = $StepMarker.duplicate()
	add_child_below_node($StepMarker,newStep)
	for P in get_simple_path($StartingPosition.global_position,ceneter_from_global(get_global_mouse_position())):
		finalPath.add_point(P)
	newStep.global_position = $EndPosition.global_position
	$StartingPosition.global_position = $EndPosition.global_position
	$FinalPath.points = finalPath.get_baked_points()
	pass

func play_path():
	lockPath = true
	$AnimationPlayer.playback_speed = 200 / $StartingPosition.curve.get_baked_length()
	$AnimationPlayer.play("move")
	pass

func _input(event:InputEvent):
	if event.is_pressed() and event.is_class("InputEventMouseButton") :
		add_step()
		# add next step
		
		pass
#
#		$AnimationPlayer.playback_speed = 200 / $StartingPosition.curve.get_baked_length()
#


func _on_AnimationPlayer_animation_finished(anim_name):
	$StartingPosition.global_position = $StartingPosition/PathFollow2D.global_position
	snap_start()
	$StartingPosition/PathFollow2D.unit_offset = 0
	pass # Replace with function body.
