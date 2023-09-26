class_name ActionInstance
extends RefCounted

#base class for an instance of an action resource getting used
#these get created/destroyed when action data gets plugged into a grid square
#stores/listens to UI elements for variables for settings
#overthinking effects a bit just use a default mag for now

var action_data : ActionData
var direction : Vector2


func _init(action_data : ActionData):
	self.action_data = action_data
	
