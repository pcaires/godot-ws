extends Viewport

var mode = false
var id = 0

func _ready():
	var s = $TextureRect.get_texture().get_size()*1.2
	set_size(s)


func _on_TextureRect_mouse_entered():
	mode = true


func _on_TextureRect_mouse_exited():
	mode = false

func _input(event):
	if event is InputEventMouseButton and mode:
		if event.is_pressed():
			if event.get_button_index() == 1:
				var wp = preload("res://waypoint.tscn").instance()
				var anc = Vector2(get_mouse_position().x/get_size().x,get_mouse_position().y/get_size().y)
				wp.set_anchor(MARGIN_LEFT,anc.x)
				wp.set_anchor(MARGIN_TOP,anc.y)
				wp.set_name(str(id))
				wp.get_child(0).set_text(wp.get_name())
				$wp.add_child(wp)
				id += 1

func _on_selected(id):
	print(get_parent().name)
	print(get_parent().name == id)
	get_parent().set_visible(get_parent().name == id)
	set_disable_input(!(get_parent().name == id))
