extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	var roomSpace = []
	for R in $Rooms.get_rooms_connected_to_window($DoorsWindows/Window): 
		roomSpace.append_array($Rooms.allRooms[R])
	$FogOfWar.update_fog(roomSpace)
	roomSpace.clear()
	
	for R in $Rooms.get_rooms_connected_to_window($DoorsWindows/Door2): 
		roomSpace.append_array($Rooms.allRooms[R])

	$FogOfWar.update_fog(roomSpace)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func player_triggered_fog_update(area:Area2D):
	pass

func _on_Window_area_entered(area):
	pass # Replace with function body.


func _on_MoveAnimation_animation_finished(anim_name):
	$PlayerMover.global_position = $PlayerMover/PathFollow2D.global_position
	$PlayerMover/PathFollow2D.unit_offset = 0
	$PathPreview.lockPath = false
	$PathPreview.reset_path()
	pass # Replace with function body.


func _on_Button_pressed():
	$PlayerMover.curve = $PathPreview.get_curve()
	$PathPreview.lockPath = true
	$PlayerMover/MoveAnimation.play("move")
	pass # Replace with function body.
