class_name ActionGrid
extends Node

#so every columns entries is one row


func CompileGrid():
	var action_squares : Array
	
	for child in $GridContainer.get_children():
		if child.action_data != null:
			action_squares.append(child)
	
	var delta = Vector2i()
	for action_square in action_squares:
		print(action_square.action_data.effects[0].vibe_delta)
		delta += action_square.action_data.effects[0].vibe_delta
	print(delta)


func _on_end_turn_button_pressed() -> void:
	CompileGrid()
