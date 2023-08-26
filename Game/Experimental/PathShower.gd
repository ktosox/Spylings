extends Navigation2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lockPath = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveRangeHiglight.update_dirty_quadrants()
	snap_start()
	
	pass # Replace with function body.

func ceneter_from_global(globalPos):
	var localPos = to_local(globalPos)
	return $MoveRangeHiglight.world_to_map(localPos) * $MoveRangeHiglight.cell_size + ($MoveRangeHiglight.cell_size/2)

func update_path():
	$Path.clear_points()
	$StartingPosition.curve.clear_points()

	#$Path.add_point($StartingPosition.global_position)
	for P in get_simple_path($StartingPosition.global_position,ceneter_from_global(get_global_mouse_position() - $Path.global_position)):
		$StartingPosition.curve.add_point(P - $StartingPosition.global_position)
		$Path.add_point(P)
	#$Path.add_point( ceneter_from_global(get_global_mouse_position() - $Path.global_position))
	$EndPosition.global_position = ceneter_from_global(get_global_mouse_position())
	pass

func snap_start():
	$StartingPosition.global_position = ceneter_from_global($StartingPosition.global_position)
	$StartingPosition/PathFollow2D.global_position = $StartingPosition.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !lockPath:
		update_path()
	
	pass


func _input(event):
	if event.is_action_pressed("ui_accept"):
		lockPath = true
		
		$AnimationPlayer.playback_speed = 200 / $StartingPosition.curve.get_baked_length()
		$AnimationPlayer.play("move")
		


func _on_AnimationPlayer_animation_finished(anim_name):
	lockPath = false
	$StartingPosition.global_position = $StartingPosition/PathFollow2D.global_position
	snap_start()
	$StartingPosition/PathFollow2D.unit_offset = 0
	pass # Replace with function body.
