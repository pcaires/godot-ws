extends Control


# Create signal for selected tab

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#Connect File Button signal


func on_file_id_pressed(id):
	if id == 0:
		var name_id = $Tabs.get_tab_count()
		add_tab(str(name_id))
		if name_id == 0:
			_on_Tabs_tab_changed(0)
	

func _on_GUI_popup_hide():
	get_tree().quit()

func add_tab(name_id):
	# Create function to add editor same name as tab
	pass


func _on_Tabs_tab_close(tab):  #Connect tabs signal (editor)
	var name_id = $Tabs.get_tab_title(tab)
	$Tabs.remove_tab(tab)
	$TabsChild.get_node(name_id).queue_free()


func _on_Tabs_tab_changed(tab):  #Connect Tabs signal (editor)
	var name_id = $Tabs.get_tab_title(tab)
	# Emit custom signal

	
