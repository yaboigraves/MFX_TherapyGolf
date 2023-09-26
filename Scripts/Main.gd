class_name Main
extends Node

var vibe_meter : VibeMeter

func _ready() -> void:
	$Control/grid.TimeSliceReady.connect(HandleTimeSliceReady)
	vibe_meter = $VibeMeter

func HandleTimeSliceReady(squares):
	var action_instances : Array[ActionInstance]
	
	for square in squares:
		if square.action_data != null:
			action_instances.append(square.action_instance)
	
	#go over the instances, look at magnitude and direction, modify vibe meter by that much
	#each time slice gets sent to the vibe meter for application im assuming?
	#or nah we do that here
	#just tell the vibe meter to move
	
	for action_instance in action_instances:
#		print("moving ", 1, " at ", action_instance.direction)
		vibe_meter.MoveVibe(action_instance.direction * 100)
