extends VBoxContainer


var cur_value : int

func _on_button_pressed():
	if cur_value >= 20:
		return
		
	cur_value += 1
	$StatLabel.text = str(cur_value)

func _on_button_2_pressed():
	if cur_value <= 0:
		return
		
	cur_value -= 1
	$StatLabel.text = str(cur_value)
