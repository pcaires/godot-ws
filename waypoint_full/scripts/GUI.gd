extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal selected(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleBar/FileButton.get_popup().connect("id_pressed",self,"on_file_id_pressed")


func on_file_id_pressed(id):
	if id == 0:
		var name_id = $Tabs.get_tab_count()
		add_tab(str(name_id))
		if name_id == 0:
			_on_Tabs_tab_changed(0)
	if id == 2:
		save_file()
	

func _on_GUI_popup_hide():
	get_tree().quit()

func add_tab(name_id):
	$Tabs.add_tab(name_id)
	var editor = preload("res://edit.tscn").instance()
	editor.name = name_id
	connect("selected",editor.get_child(0),"_on_selected")
	$TabsChild.add_child(editor)
	#$TitleBar/FileButton.get_popup().set_item_disabled(2, false)


func _on_Tabs_tab_close(tab):
	var name_id = $Tabs.get_tab_title(tab)
	$Tabs.remove_tab(tab)
	$TabsChild.get_node(name_id).queue_free()


func _on_Tabs_tab_changed(tab):
	var name_id = $Tabs.get_tab_title(tab)
	emit_signal("selected",name_id)

func save_file():
	var id = $Tabs.get_current_tab()
	
