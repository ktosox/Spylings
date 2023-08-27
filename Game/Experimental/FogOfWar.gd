extends TileMap


# cells 
# 0 White
# 1 Gray
# 2 Black

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_fog(newWhiteCells:Array):
	# all white cells become gray calls
	for W in get_used_cells_by_id(0):
		set_cellv(W, 1)
	# set all new White Cells
	for N in newWhiteCells:
		set_cellv(N, 0)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
