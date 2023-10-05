extends Node2D


# Responsible for:
# Registering new steps
# Saving steps
# passing on the steps

var currentPath : AgentPath

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



func reset_path(): # cretes empty path object and prepers variables
	currentPath = AgentPath.new()
	
	pass
