extends HBoxContainer




func _on_button_pressed():
	GlobalManager._class_name  = "Cleric"
	_trigger_popup()
	
func _trigger_popup():
	GlobalManager._call_popup()
	printerr(GlobalManager._class_name)
	GlobalManager._check_class_derivatives()
	printerr(GlobalManager._class_hit_die)
#	get_node("/root/Control/PopUp").set_visible(true)
#	get_node("/root/Control/PopUp/Panel/Label").text = "Class: " + GlobalManager._class_name



func _on_button_2_pressed():
	GlobalManager._class_name  = "Warlock"
	_trigger_popup()
