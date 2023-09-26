class_name ActionGrid
extends Node

signal TimeSliceReady



func CompileGrid():
	var action_squares : Array
	
	for i in range(4):
		#go over each row with a wait
		var squares = GetBeatSquares(i)

		TimeSliceReady.emit(squares)
		#so here is where we can process the squares in a sep function
		#but they can emit to main
		#main should actually process these probably
		#take a row of squares, hand it off to main and it handles it
		
		






		
		for square in squares:
			square.self_modulate = Color.RED
		
		$Timer.start()
		await  $Timer.timeout
		
	for square in $GridContainer.get_children():
		square.self_modulate = Color.WHITE
	

func GetBeatSquares(beat: int):
	var squares = []
	
	for i in range(beat, $GridContainer.get_child_count(), 4):
		squares.append($GridContainer.get_child(i))

	#flip so bottom lane is first
	squares.reverse()
	
	return squares

func _on_end_turn_button_pressed() -> void:
	CompileGrid()
