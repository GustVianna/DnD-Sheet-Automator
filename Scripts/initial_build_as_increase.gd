extends Control

var stat_buttons
var plus_one_buttons
var plus_two_buttons


# Called when the node enters the scene tree for the first time.
func _ready():
	stat_buttons = get_tree().get_nodes_in_group("StatButton")
	plus_one_buttons = get_tree().get_nodes_in_group("+1Check")
	plus_two_buttons = get_tree().get_nodes_in_group("+2Check")
	
	for button in plus_one_buttons:
		button.toggled.connect(plus_one_pressed.bind(button))
		
	for button in plus_two_buttons:
		button.toggled.connect(plus_two_pressed.bind(button))
	
	for button_index in stat_buttons.size():
		stat_buttons[button_index].label_name = str(GlobalManager.ability_scores.values()[button_index])

func plus_one_pressed(toggled_on, button):
	if toggled_on:
		var neighbor_button = button.get_node("../../../HBoxContainer/Label").get_child(0)
		neighbor_button.button_pressed = false
		
		var value = button.get_node("../../../../../../../..").get_child(0).label_name
		value = value.to_int()
		value += 1
		button.get_node("../../../../../../../..").get_child(0).label_name = str(value)
		
	else:
		var value = button.get_node("../../../../../../../..").get_child(0).label_name
		value = value.to_int()
		value -= 1
		button.get_node("../../../../../../../..").get_child(0).label_name = str(value)
	pass

func plus_two_pressed(toggled_on, button):
	
	if toggled_on:
		var neighbor_button = button.get_node("../../../HBoxContainer2/Label").get_child(0)
		neighbor_button.button_pressed = false
		
		var value = button.get_node("../../../../../../../..").get_child(0).label_name
		value = value.to_int()
		value += 2
		button.get_node("../../../../../../../..").get_child(0).label_name = str(value)
		
	else:
		var value = button.get_node("../../../../../../../..").get_child(0).label_name
		value = value.to_int()
		value -= 2
		button.get_node("../../../../../../../..").get_child(0).label_name = str(value)

func _on_next_button_pressed():
	for index in stat_buttons.size():
		GlobalManager.ability_scores[stat_buttons[index].name] = stat_buttons[index].label_name.to_int()
		printerr(GlobalManager.ability_scores[stat_buttons[index].name])
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildEquipment.tscn") # set to HP next


func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildStats.tscn")
