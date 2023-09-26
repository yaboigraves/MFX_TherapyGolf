class_name AimRadial
extends Control

signal DirectionUpdated(dir:Vector3)

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	var dir = (get_viewport().get_mouse_position() -global_position).normalized()
	
	rotation = dir.angle() + PI/2.0
	
	DirectionUpdated.emit(dir)


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			set_process(true)
	
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_released():
			set_process(false)
