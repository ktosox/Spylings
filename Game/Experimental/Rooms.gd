extends TileMap




var allRooms = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# get all cells
	var allCells = get_used_cells()
	
	# declare a new room
	var roomID = 1


	while allCells.size() > 1 :
		var seedCell = [allCells[0]]
		set_cellv(seedCell[0],1)
		var cellsToCheck = [seedCell[0]+Vector2(0,1),seedCell[0]+Vector2(0,-1),seedCell[0]+Vector2(1,0),seedCell[0]+Vector2(-1,0)]
		all_touching_cells(seedCell,cellsToCheck)
		for R in seedCell:
			allCells.erase(R)

		allRooms[roomID] = seedCell
		roomID += 1
	# take one and detect all cells it touches

	# assign all cells to the room
	
	# remove all detected cells from list
	
	# reapeat

	pass # Replace with function body.

func get_rooms_connected_to_window(window:Node2D):
	var rooms = []
	for X in [-64,0,64] :
		for Y in [-64,0,64] :
			var result = room_from_point(window.global_position + Vector2(X,Y))
			if result != null:
				if !rooms.has(result):
					rooms.push_front(result)
			
	return rooms

func room_from_point(point):
	var target_cell = world_to_map(to_local(point) )
	for R in allRooms.keys():
		if allRooms[R].has(target_cell) : 
			return R
	return null
	pass


func all_touching_cells(checkedCells:Array, nextCells:Array):
	
	# checkedCells is an array, it contains all valid cells
	
	# nextCells is an array , it has all of the cells that need to be checked
	
	
	var potentialCells = []
	# add all of the cells that need to be checked
	
	for N in nextCells :
		if get_cellv(N) == 0:
			checkedCells.push_front(N)
			set_cellv(N,1)
			potentialCells.push_front(N+Vector2(1,0))
			potentialCells.push_front(N+Vector2(-1,0))
			potentialCells.push_front(N+Vector2(0,-1))
			potentialCells.push_front(N+Vector2(0,1))
		pass
	if potentialCells.size()==0:
		return checkedCells
	else:
		all_touching_cells(checkedCells,potentialCells)
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

