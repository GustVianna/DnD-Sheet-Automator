extends Control

var current_stat_button
var current_roll_button
var stat_mode

var point_buy_label
var point_buy_panel
var point_buy_total

var up_buttons
var down_buttons
var stat_buttons
var roll_buttons

var roll_collection = []

var rolls
var buttons_container

var roll_label
var roll_values

var standard_array = load("res://Scenes/standard_values.tscn").instantiate()

signal dice_rolled(Array)

var roll_pressed_first = false
var roll_value

signal roll_button_pressed
signal screen_touched

func _ready():
	GlobalManager.back_pressed.connect(_on_back_pressed)
	
	up_buttons = get_tree().get_nodes_in_group("UpStatButton")
	down_buttons = get_tree().get_nodes_in_group("DownStatButton")
	stat_buttons = get_tree().get_nodes_in_group("StatButton")
	roll_buttons = get_tree().get_nodes_in_group("RollButtons")
	
	roll_label = get_tree().get_nodes_in_group("RollLabel")
	roll_values = get_tree().get_nodes_in_group("RollValues")
	
	point_buy_label = $VBoxContainer/VBoxContainer/PointBuy/PanelContainer/MarginContainer/PointBuyAmount
	point_buy_panel = $VBoxContainer/VBoxContainer/PointBuy
	point_buy_total = 27
	rolls = $VBoxContainer/VBoxContainer/Rolls
	buttons_container = $VBoxContainer/VBoxContainer/PanelContainer/MarginContainer/ButtonsContainer
	
	for index in up_buttons.size():
		up_buttons[index].pressed.connect(_add_stats.bind(up_buttons.find(up_buttons[index])))
		up_buttons[index].visible = false
		
	for index in down_buttons.size():
		down_buttons[index].pressed.connect(_remove_stats.bind(down_buttons.find(down_buttons[index])))
		down_buttons[index].visible = false
		
	for index in stat_buttons.size():
		stat_buttons[index].pressed.connect(_on_stats_button_pressed.bind(stat_buttons.find(stat_buttons[index])))
		
	for index in roll_buttons.size():
		roll_buttons[index].pressed.connect(on_roll_button_pressed.bind(roll_buttons.find(roll_buttons[index])))
		
	_show_updated_stats()
	_hide_stat_arrows()
	_on_recommended_selected()
	
	buttons_container.modeSelected.connect(_mode_controller)

func _process(delta):
	if Input.is_action_just_released("ui_touch"):
		screen_touched.emit()
		var curPos = get_global_mouse_position()
		
		if standard_array.is_inside_tree() == true:
			if !Rect2(standard_array.get_global_rect()).has_point(curPos):
				#standard_array.get_parent().remove_child(standard_array)
				pass
		for button in stat_buttons:
			if !Rect2(button.get_global_rect()).has_point(curPos):
				for stat_button in stat_buttons:
					stat_button.get_child(2).current_animation = "RESET"

func _mode_controller(mode):
	stat_mode = mode
	
	match(mode):
		"Recommended":
			_on_recommended_selected()
			
		"Standard":
			_on_standard_selected()
			
		"Buy":
			_on_point_buy_selected()
			
		"Manual":
			_on_manual_selected()
			
		"Roll":
			_on_roll_selected()

func _add_stats(button_index):
	if stat_mode == "Buy":
		if point_buy_total <= 0:
			return
		
		await GlobalManager.change_base_stats(GlobalManager.ability_scores.keys()[button_index], 1, 8, 15)
		_show_updated_stats()
		_update_point_buy()

	else:
		GlobalManager.change_base_stats(GlobalManager.ability_scores.keys()[button_index], 1, 1, 20)
		_show_updated_stats()

func _remove_stats(button_index):
	
	if stat_mode == "Buy":
		if point_buy_total >= 27:
			return
		
		await GlobalManager.change_base_stats(GlobalManager.ability_scores.keys()[button_index], -1, 8, 15)
		_show_updated_stats()
		_update_point_buy()
		
	else:
		GlobalManager.change_base_stats(GlobalManager.ability_scores.keys()[button_index], -1, 1, 20)
		_show_updated_stats()

func _show_updated_stats():
	for index in stat_buttons.size():
		stat_buttons[index].label_name = str(GlobalManager.ability_scores.values()[index])

func _on_next_button_pressed():
	for button in stat_buttons:
		if button.label_name == "+":
			button.label_name = "0"
	GlobalManager.ability_scores["Strength"] = $VBoxContainer/VBoxContainer/Stats/Strength/Strength.label_name.to_int()
	GlobalManager.ability_scores["Dexterity"] = $VBoxContainer/VBoxContainer/Stats/Dexterity/Dexterity.label_name.to_int()
	GlobalManager.ability_scores["Constitution"] = $VBoxContainer/VBoxContainer/Stats/Constitution/Constitution.label_name.to_int()
	GlobalManager.ability_scores["Intelligence"] = $VBoxContainer/VBoxContainer/Stats/Intelligence/Intelligence.label_name.to_int()
	GlobalManager.ability_scores["Wisdom"] = $VBoxContainer/VBoxContainer/Stats/Wisdom/Wisdom.label_name.to_int()
	GlobalManager.ability_scores["Charisma"] = $VBoxContainer/VBoxContainer/Stats/Charisma/Charisma.label_name.to_int()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/initial_build_as_increase.tscn")

#Recommended DONE
func _on_recommended_selected():
	_hide_stat_arrows()
	rolls.visible = false
	
	var initial_class = GlobalManager._class_order[0]
	
	match initial_class:
		"Artificer":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 14
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 15
			GlobalManager.ability_scores["Wisdom"] = 12
			GlobalManager.ability_scores["Charisma"] = 8
			
		"Barbarian":
			GlobalManager.ability_scores["Strength"] = 15
			GlobalManager.ability_scores["Dexterity"] = 14
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 8
			GlobalManager.ability_scores["Wisdom"] = 10
			GlobalManager.ability_scores["Charisma"] = 10
			
		"Bard":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 15
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 8
			GlobalManager.ability_scores["Wisdom"] = 10
			GlobalManager.ability_scores["Charisma"] = 15
			
		"Cleric":
			GlobalManager.ability_scores["Strength"] = 14
			GlobalManager.ability_scores["Dexterity"] = 8
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 10
			GlobalManager.ability_scores["Wisdom"] = 15
			GlobalManager.ability_scores["Charisma"] = 10
			
		"Druid":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 14
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 12
			GlobalManager.ability_scores["Wisdom"] = 15
			GlobalManager.ability_scores["Charisma"] = 8
			
		"Fighter":
			GlobalManager.ability_scores["Strength"] = 15
			GlobalManager.ability_scores["Dexterity"] = 10
			GlobalManager.ability_scores["Constitution"] = 15
			GlobalManager.ability_scores["Intelligence"] = 10
			GlobalManager.ability_scores["Wisdom"] = 12
			GlobalManager.ability_scores["Charisma"] = 9
			
		"Monk":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 15
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 10
			GlobalManager.ability_scores["Wisdom"] = 15
			GlobalManager.ability_scores["Charisma"] = 8
			
		"Paladin":
			GlobalManager.ability_scores["Strength"] = 15
			GlobalManager.ability_scores["Dexterity"] = 8
			GlobalManager.ability_scores["Constitution"] = 15
			GlobalManager.ability_scores["Intelligence"] = 8
			GlobalManager.ability_scores["Wisdom"] = 8
			GlobalManager.ability_scores["Charisma"] = 15
			
		"Ranger":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 15
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 10
			GlobalManager.ability_scores["Wisdom"] = 15
			GlobalManager.ability_scores["Charisma"] = 8
			
		"Rogue":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 15
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 11
			GlobalManager.ability_scores["Wisdom"] = 12
			GlobalManager.ability_scores["Charisma"] = 12
			
		"Sorcerer":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 14
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 10
			GlobalManager.ability_scores["Wisdom"] = 10
			GlobalManager.ability_scores["Charisma"] = 15
			
		"Warlock":
			GlobalManager.ability_scores["Strength"] = 10
			GlobalManager.ability_scores["Dexterity"] = 15
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 8
			GlobalManager.ability_scores["Wisdom"] = 8
			GlobalManager.ability_scores["Charisma"] = 15
			
		"Wizard":
			GlobalManager.ability_scores["Strength"] = 8
			GlobalManager.ability_scores["Dexterity"] = 14
			GlobalManager.ability_scores["Constitution"] = 14
			GlobalManager.ability_scores["Intelligence"] = 15
			GlobalManager.ability_scores["Wisdom"] = 12
			GlobalManager.ability_scores["Charisma"] = 8
			
	_show_updated_stats()

#Standard DONE
func _on_standard_selected():
	_hide_stat_arrows()
	point_buy_panel.visible = false

func _on_stats_button_pressed(button_index):
	if stat_mode != "Standard" && stat_mode != "Roll":
		return
	
	if stat_mode == "Standard":
		if standard_array.is_inside_tree():
			standard_array.get_parent().remove_child(standard_array)
		
		elif !standard_array.is_inside_tree():
			get_node(str(stat_buttons[button_index].get_path())+"/..").add_child(standard_array)
			standard_array.get_parent().move_child(standard_array.get_parent().get_node("StandardValues"), 1)
		
		current_stat_button = stat_buttons[button_index]
	
	elif stat_mode == "Roll":
		if roll_pressed_first:
			stat_buttons[button_index].label_name = roll_value
			
			for button in stat_buttons:
				button.get_child(2).current_animation = "RESET"
				
			roll_pressed_first = false
				
		else:
			pass
		#_show_updated_stats()

func _on_value_selected(value_amount):
	
	var button_index = stat_buttons.find(current_stat_button)
	GlobalManager.reset_base_stats(GlobalManager.ability_scores.keys()[button_index])
	
	GlobalManager.change_base_stats(GlobalManager.ability_scores.keys()[button_index], value_amount, 1, 20)
	_show_updated_stats()

func _on_clear_selected():
	var button_index = stat_buttons.find(current_stat_button)
	
	GlobalManager.reset_base_stats(GlobalManager.ability_scores.keys()[button_index])
	_show_updated_stats()

#Point Buy DONE
func _on_point_buy_selected():
	rolls.visible = false
	_show_stat_arrows()
	point_buy_panel.visible = true
	
	GlobalManager.ability_scores["Strength"] = 8
	GlobalManager.ability_scores["Dexterity"] = 8
	GlobalManager.ability_scores["Constitution"] = 8
	GlobalManager.ability_scores["Intelligence"] = 8
	GlobalManager.ability_scores["Wisdom"] = 8
	GlobalManager.ability_scores["Charisma"] = 8
	
	_show_updated_stats()

func _update_point_buy():
	
	point_buy_total = 27
	for stat in stat_buttons:
		match stat.label_name:
			"9":
				point_buy_total -= 1
			"10":
				point_buy_total -= 2
			"11":
				point_buy_total -= 3
			"12":
				point_buy_total -= 4
			"13":
				point_buy_total -= 5
			"14":
				point_buy_total -= 7
			"15":
				point_buy_total -= 9
	
	point_buy_label.text = str(point_buy_total) + "/27\nPoints remaining"

func _show_stat_arrows():
	
	for index in up_buttons.size():
		up_buttons[index].visible = true
		
	for index in down_buttons.size():
		down_buttons[index].visible = true

func _hide_stat_arrows():
	
	for index in up_buttons.size():
		up_buttons[index].visible = false
		
	for index in down_buttons.size():
		down_buttons[index].visible = false

#Roll
func _on_roll_selected():
	_switch_stat_button_to_plus()
	_hide_stat_arrows()
	rolls.visible = true
	
	point_buy_panel.visible = false

func _switch_stat_button_to_plus():
	
	for button in stat_buttons:
		button.label_name = "+"

func _on_roll_1_pressed():
	
	var roll_value = GlobalManager.roll_dice(4, 6, 0)
	
	if roll_collection.size() < 6:
		roll_collection.append(roll_value)
		
	update_rolls()

func update_rolls():
	for value in roll_values:
		value.text = "-"
		
	for label in roll_label:
		label.text = "-"
	
	for index in roll_collection.size():
		roll_collection[index][1].sort()
		roll_values[index].text = "[center][color=#CE1212]" + str(roll_collection[index][1][0]) + "[/color]" + " " + str(roll_collection[index][1][1]) +" "+ str(roll_collection[index][1][2]) +" "+ str(roll_collection[index][1][3]) + "[/center]"
		var total_minus_min = roll_collection[index][1][1]+roll_collection[index][1][2]+roll_collection[index][1][3]
		roll_label[index].text = str(total_minus_min)

#Manual
func _on_manual_selected():
	rolls.visible = false
	_show_stat_arrows()
	_show_updated_stats()
	point_buy_panel.visible = false


func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildClass.tscn")

func _on_clear_pressed():
	roll_collection.remove_at(0)
	update_rolls()

func _on_clear2_pressed():
	roll_collection.remove_at(1)
	update_rolls()

func _on_clear3_pressed():
	roll_collection.remove_at(2)
	update_rolls()

func _on_clear4_pressed():
	roll_collection.remove_at(3)
	update_rolls()

func _on_clear5_pressed():
	roll_collection.remove_at(4)
	update_rolls()

func _on_clear6_pressed():
	roll_collection.remove_at(5)
	update_rolls()

func on_roll_button_pressed(button_index):
	if roll_buttons[button_index].get_node("MarginContainer/HBoxContainer/Label").text == "-":
		return
		
	else:
		$"..".scroll_vertical = 335
		for button in stat_buttons:
			button.get_child(2).current_animation = "button_shaking"
			
		roll_buttons[button_index].theme = load("res://Assets/Themes/ThemeYellow.tres")
		roll_buttons[button_index].get_node("AnimationPlayer").current_animation = "button_shaking"
		await screen_touched
		
		roll_pressed_first = true
		roll_value = roll_buttons[button_index].get_node("MarginContainer/HBoxContainer/Label").text
		roll_buttons[button_index].theme = load("res://Assets/Themes/TestTheme.tres")
		roll_buttons[button_index].get_node("AnimationPlayer").current_animation = "RESET"
