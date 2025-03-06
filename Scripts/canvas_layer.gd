extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalManager.back_pressed.connect(on_back_pressed)
	
	if FileAccess.file_exists(SaveLoad.path + SaveLoad.save_file_name1):
		$MarginContainer/VBoxContainer/NewFile.visible = false
		$MarginContainer/VBoxContainer/LoadFile.visible = true
		
		var file = FileAccess.open(SaveLoad.path + SaveLoad.save_file_name1, FileAccess.READ)
		var json = file.get_as_text()
		var saved_data = JSON.parse_string(json)
		
		$MarginContainer/VBoxContainer/LoadFile/SaveInformation/HBoxContainer2/VBoxContainer/AdventureName.text = saved_data["adv_name"]
		$MarginContainer/VBoxContainer/LoadFile/SaveInformation/HBoxContainer2/VBoxContainer/CharacterName.text = saved_data["char_name"]
		
		file.close()
		
	if FileAccess.file_exists(SaveLoad.path + SaveLoad.save_file_name2):
		$MarginContainer/VBoxContainer/NewFile2.visible = false
		$MarginContainer/VBoxContainer/LoadFile2.visible = true
		
		var file = FileAccess.open(SaveLoad.path + SaveLoad.save_file_name2, FileAccess.READ)
		var json = file.get_as_text()
		var saved_data = JSON.parse_string(json)
		
		$MarginContainer/VBoxContainer/LoadFile2/SaveInformation/HBoxContainer2/VBoxContainer/AdventureName.text = saved_data["adv_name"]
		$MarginContainer/VBoxContainer/LoadFile2/SaveInformation/HBoxContainer2/VBoxContainer/CharacterName.text = saved_data["char_name"]
		
		file.close()
	
	if FileAccess.file_exists(SaveLoad.path + SaveLoad.save_file_name3):
		$MarginContainer/VBoxContainer/NewFile3.visible = false
		$MarginContainer/VBoxContainer/LoadFile3.visible = true
		
		var file = FileAccess.open(SaveLoad.path + SaveLoad.save_file_name3, FileAccess.READ)
		var json = file.get_as_text()
		var saved_data = JSON.parse_string(json)
		
		$MarginContainer/VBoxContainer/LoadFile3/SaveInformation/HBoxContainer2/VBoxContainer/AdventureName.text = saved_data["adv_name"]
		$MarginContainer/VBoxContainer/LoadFile3/SaveInformation/HBoxContainer2/VBoxContainer/CharacterName.text = saved_data["char_name"]
		
		file.close()
		
	if FileAccess.file_exists(SaveLoad.path + SaveLoad.save_file_name4):
		$MarginContainer/VBoxContainer/NewFile4.visible = false
		$MarginContainer/VBoxContainer/LoadFile4.visible = true
		
		var file = FileAccess.open(SaveLoad.path + SaveLoad.save_file_name4, FileAccess.READ)
		var json = file.get_as_text()
		var saved_data = JSON.parse_string(json)
		
		$MarginContainer/VBoxContainer/LoadFile4/SaveInformation/HBoxContainer2/VBoxContainer/AdventureName.text = saved_data["adv_name"]
		$MarginContainer/VBoxContainer/LoadFile4/SaveInformation/HBoxContainer2/VBoxContainer/CharacterName.text = saved_data["char_name"]
		
		file.close()

func _on_button_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name1
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuild.tscn");

func _on_new_file_2_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name2
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuild.tscn");

func _on_new_file_3_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name3
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuild.tscn");

func _on_new_file_4_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name4
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuild.tscn");

func _on_load_file_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name1
	SaveLoad.load_game()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn");

func _on_load_file_2_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name2
	SaveLoad.load_game()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn");

func _on_load_file_3_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name3
	SaveLoad.load_game()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn");

func _on_load_file_4_pressed():
	SaveLoad.currentSave = SaveLoad.save_file_name4
	SaveLoad.load_game()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn");

func _on_delete_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	SaveLoad.currentSave = SaveLoad.save_file_name1
	
	await popup_confirmation.confirm
	SaveLoad.delete_save()
	get_tree().reload_current_scene()
	popup_confirmation.queue_free()

func _on_delete_2_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	SaveLoad.currentSave = SaveLoad.save_file_name2
	
	await popup_confirmation.confirm
	SaveLoad.delete_save()
	get_tree().reload_current_scene()
	popup_confirmation.queue_free()

func _on_delete_3_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	SaveLoad.currentSave = SaveLoad.save_file_name3
	
	await popup_confirmation.confirm
	SaveLoad.delete_save()
	get_tree().reload_current_scene()
	popup_confirmation.queue_free()

func _on_delete_4_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	SaveLoad.currentSave = SaveLoad.save_file_name4
	
	await popup_confirmation.confirm
	SaveLoad.delete_save()
	get_tree().reload_current_scene()
	popup_confirmation.queue_free()

func on_back_pressed():
	get_tree().quit()
