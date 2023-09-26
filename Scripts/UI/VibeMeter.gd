class_name VibeMeter
extends Node

#so lets start by hand placing and compiling them?
#so we have a collection of target locations
#we can actually lowkey probably use areas for this...


func MoveVibe(delta : Vector2):
	$VibeVector.position += delta
	
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("You hit a zone yay, delete it")
	area.get_parent().queue_free()
