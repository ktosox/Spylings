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



func player_triggered_fog_update(area:Area2D):
	var newCells = []
	for A in $Rooms.get_rooms_connected_to_window(area):
		newCells.append_array($Rooms.allRooms[A])
	$FogOfWar.update_fog(newCells)
	pass




func _on_Button_pressed():

	pass # Replace with function body.



#	print()
#	
