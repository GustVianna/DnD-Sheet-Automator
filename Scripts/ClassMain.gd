extends Control




func _ready():
	GlobalManager.back_pressed.connect(_on_back_pressed)
	
	if GlobalManager._class_order.size() <= 0:
		$VBoxContainer2/Next.visible = false
	
	for index in GlobalManager._class_order.size():
		var class_button_instance = load("res://Scenes/ClassButton.tscn").instantiate()
		$VBoxContainer2/VBoxContainer.add_child(class_button_instance)
		class_button_instance.add_to_group("ClassButtons")
		
		var class_buttons = get_tree().get_nodes_in_group("ClassButtons")
		class_buttons[index].get_node("MarginContainer/HBoxContainer/Label").text = GlobalManager._class_order[index]
		class_buttons[index].get_node("MarginContainer/HBoxContainer/VBoxContainer/LevelButton").label_name = str(GlobalManager._class_name.get(GlobalManager._class_order[index]))
		
		class_buttons[index].level_cap_reached.connect(_on_level_cap_reached)
		class_buttons[index].level_cap_exited.connect(_on_level_cap_exited)
		
		$VBoxContainer2/Next.visible = true
		
	$VBoxContainer2/VBoxContainer.move_child($VBoxContainer2/VBoxContainer/AddButton, $VBoxContainer2/VBoxContainer.get_child_count())


func _on_add_button_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildClass.tscn")
	
func _on_level_cap_reached():
	$VBoxContainer2/VBoxContainer/AddButton.visible = false
	
func _on_level_cap_exited():
	$VBoxContainer2/VBoxContainer/AddButton.visible = true

func _on_next_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildStats.tscn")


func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuild.tscn");
