extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print($Rooms.get_rooms_connected_to_window($DoorsWindows/Door) )

	pass # Replace with function body.

func fog_update(roomIDs:Array):
	var newWhiteCells = []
	
	for R in roomIDs:
		var nextRoom = $Rooms.get_room_cells(roomIDs)
		newWhiteCells.append_array(nextRoom)
	$FogOfWar.update_fog(newWhiteCells)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func player_triggered_fog_update(area:Area2D):
	pass

func _on_Window_area_entered(area):
	pass # Replace with function body.
