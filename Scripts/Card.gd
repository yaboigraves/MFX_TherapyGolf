class_name Card
extends TextureRect

var action_data : ActionData:
	set(data):
		action_data = data
		texture = action_data.texture


func _get_drag_data(at_position: Vector2) -> Variant:
	var rect = TextureRect.new()
	rect.size = Vector2(100,100)
	rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	rect.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	rect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rect.texture = action_data.texture
	
	set_drag_preview(rect)
	
	return self
