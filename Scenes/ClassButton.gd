extends Button

signal level_cap_reached
signal level_cap_exited

signal menu_popped

var level_button
var label

func _ready():
	level_button = $MarginContainer/HBoxContainer/VBoxContainer/LevelButton
	label = $MarginContainer/HBoxContainer/Label
	
func _on_up_pressed():
	
	var level_values = GlobalManager._class_name.values()
	var sum_level_values = 0
	
	for level_value in level_values.size():
		sum_level_values += level_values[level_value]
	
	
	
	if sum_level_values <= 19:
		var value = int(level_button.label_name)
		value += 1
		sum_level_values += 1
		level_button.label_name = str(value)
		GlobalManager._class_name.erase(label.text)
		GlobalManager._class_name[label.text] = int(level_button.label_name)
		level_cap_exited.emit()
		
		
	if sum_level_values == 20:
		level_cap_reached.emit()
		


func _on_down_pressed():
	
	if int(level_button.label_name) > 1:
		var value = int(level_button.label_name)
		value -= 1
		level_button.label_name = str(value)
		GlobalManager._class_name.erase(label.text)
		GlobalManager._class_name[label.text] = int(level_button.label_name)
		level_cap_exited.emit()


func _on_pressed():
	GlobalManager._call_class_popup_menu(label.text, "/root/InitialBuildClassMain")
	menu_popped.emit()


func _on_delete_pressed():
	GlobalManager._class_name.erase(label.text)
	GlobalManager._class_order.erase(label.text)
	GlobalManager.data_updated.emit()
	queue_free()
