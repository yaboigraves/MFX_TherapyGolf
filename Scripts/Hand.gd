class_name Hand
extends Control

@export var actions: Array[ActionData]
@export var card_packed_scene : PackedScene

#so honestly, these new actions ought to be resources
#node experiment is annoying
#re-use some of the action buffer stuff
#we do need to compile all this data
#when you drag a card out make a thing thats sized to the amount of time it takes up
#its fine though we're branched
#so to start off we have action data

func _ready() -> void:
	for action in actions:
		var card_instance = card_packed_scene.instantiate()
		card_instance.action_data = action
		add_child(card_instance)
		

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is GridSquare:
		return true
	else:
		return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var card_instance = card_packed_scene.instantiate()
	
	card_instance.action_data = data.action_data
	add_child(card_instance)
	
	data.action_data = null
