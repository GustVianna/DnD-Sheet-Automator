extends HBoxContainer

var statType = ["Recommended", "Standard", "Buy", "Manual", "Roll"]

var index = 0
signal modeSelected(mode)

func _on_right_pressed():
	if index <4:
		index += 1
		
	else:
		index = 0
		
	_update_button_text()

func _on_left_pressed():
	if index > 0:
		index -= 1
		
	else:
		index = 4
		
	_update_button_text()

func _update_button_text():
	$StatType.label_name = statType[index]
	modeSelected.emit(statType[index])
