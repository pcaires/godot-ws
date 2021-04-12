extends Panel


# Declare member variables here. Examples:
var following = false
var dragging_start_position = Vector2()

func _on_ResizerPanel_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_global_mouse_position()

func _process(delta):
	if following:
		var new_size = OS.window_size + get_global_mouse_position() - dragging_start_position
		if new_size.x > 400 and new_size.y > 70:
			OS.set_window_size(new_size)
		dragging_start_position = get_global_mouse_position()


func _on_ResizerPanel_mouse_exited():
	following = false
