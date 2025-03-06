extends Control

func _ready():
	GlobalManager.back_pressed.connect(_on_button_pressed)
	
	var class_button_array = $ScrollContainer/MarginContainer/VBoxContainer/GridContainer.get_children()
	for index in GlobalManager._class_order.size():
		if class_button_array.find(GlobalManager._class_order[index]):
			get_node("ScrollContainer/MarginContainer/VBoxContainer/GridContainer" + "/" + GlobalManager._class_order[index] + "/" + GlobalManager._class_order[index]).disabled = true

func _on_texture_button_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Barbarian", self.get_path())

func _on_texture_button_2_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Bard", self.get_path())

func _on_texture_button_3_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Cleric", self.get_path())

func _on_texture_button_4_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Druid", self.get_path())

func _on_texture_button_5_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Fighter", self.get_path())

func _on_texture_button_6_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Monk", self.get_path())

func _on_texture_button_7_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Paladin", self.get_path())

func _on_texture_button_8_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Ranger", self.get_path())

func _on_texture_button_9_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Rogue", self.get_path())

func _on_texture_button_10_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Sorcerer", self.get_path())

func _on_texture_button_11_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Warlock", self.get_path())

func _on_texture_button_12_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Wizard", self.get_path())

func _on_texture_button_13_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_class_popup_menu("Artificer", self.get_path())

func _on_button_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/initial_build_class_main.tscn")

func _on_custom_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager.call_custom_class_popup_menu(self.get_path())
