extends VBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalManager.back_pressed.connect(_on_back_pressed)
	
	var buttons = get_tree().get_nodes_in_group("ButtonClasses")
	for button in buttons:
		button.pressed.connect(_on_Button_pressed.bind(button))
		
	var drop_buttons = get_tree().get_nodes_in_group("ButtonSubclasses")
	for button in drop_buttons:
		button.pressed.connect(_on_Subclass_Button_pressed.bind(button))
		
func _on_Button_pressed(button):
	#GlobalManager.race_name = button.text
	await get_tree().create_timer(0.1).timeout
	GlobalManager._call_race_popup_menu(button.name) #Na vdd vai instanciar popup especifico de cada classe
	
func _on_Subclass_Button_pressed(button):
	var parent = button.get_parent()
	var sibling_panel = parent.get_child(1)
	
	if sibling_panel.visible == true:
		sibling_panel.visible = false
		
	else:
		sibling_panel.visible = true

func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn");
