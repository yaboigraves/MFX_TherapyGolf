class_name GridSquare
extends TextureRect

#grid square handles any child UI components/controls squares may have
#dispatches changes via signal functions to the action instance

signal AimingStateChange(aiming)
var aiming = false

@export var aim_radial : PackedScene
var action_instance : ActionInstance

var aim_radial_instance: Control

var action_data : ActionData:
	set(data):
		action_data = data
		if action_data == null:
			texture = PlaceholderTexture2D.new()
			aim_radial_instance.queue_free()

		else:
			texture = action_data.texture

			action_instance = ActionInstance.new(action_data)
		
			aim_radial_instance = aim_radial.instantiate()
			aim_radial_instance.set_anchors_preset(PRESET_CENTER)
			aim_radial_instance.DirectionUpdated.connect(HandleAimChange)
			add_child(aim_radial_instance)
		
func HandleAimChange(direction):
	action_instance.direction = direction

func _get_drag_data(at_position: Vector2) -> Variant:
	if action_data == null : return
	var rect = TextureRect.new()
	rect.size = Vector2(100,100)
	rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	rect.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	rect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rect.texture = action_data.texture
	
	set_drag_preview(rect)
	
	return self


func _drop_data(at_position: Vector2, data: Variant) -> void:
	action_data = data.action_data
	if data is Card:

		data.queue_free()
	elif data is GridSquare:
		data.action_data = null
		

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Card:
		return true
	elif data is GridSquare and action_data == null:
		return true
	else:
		return false






	
