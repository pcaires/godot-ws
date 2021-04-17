extends Viewport

var mode = false
var id = 0

func _ready():
	var s = $TextureRect.get_texture().get_size()
	set_size(s)


func _on_TextureRect_mouse_entered():
	mode = true


func _on_TextureRect_mouse_exited():
	mode = false

func _input(event):
	if event is InputEventMouseButton and mode:
		if event.is_pressed():
			if event.get_button_index() == 1:
				pass
				#ADD WAYPOINT TO SCENE

#func _on_selected(id):
#	print(get_parent().name)
#	print(get_parent().name == id)
#	get_parent().set_visible(get_parent().name == id)
#	set_disable_input(!(get_parent().name == id))
