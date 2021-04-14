extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal selected(id)
var tab_n = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleBar/FileButton.get_popup().connect("id_pressed",self,"on_file_id_pressed")


func on_file_id_pressed(id):
	if id == 0:
		add_tab(str(tab_n))
		if $Tabs.get_tab_count() == 1:
			_on_Tabs_tab_changed(tab_n)
		tab_n += 1
	

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
	if $Tabs.get_tab_count() != 0:
		var id =$Tabs.get_tab_title($Tabs.get_current_tab())
		emit_signal("selected",str(id))
		print(id)


func _on_Tabs_tab_changed(tab):
	var name_id = $Tabs.get_tab_title(tab)
	emit_signal("selected",name_id)

func save_file():
	var id = $Tabs.get_current_tab()
	
func _on_Tabs_tab_clicked(tab):
	var name_id = $Tabs.get_tab_title(tab)
	emit_signal("selected",name_id)
