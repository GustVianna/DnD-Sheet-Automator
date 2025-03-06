extends Control

func _ready():
	GlobalManager.back_pressed.connect(_on_back_pressed)

func _on_begin_adventure_pressed():
	#Save after confirming
	GlobalManager.adv_name = $MarginContainer/VBoxContainer/AdventureNameEdit.text
	SaveLoad.save_game()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

func _on_next_pressed():
	await get_tree().create_timer(0.1).timeout
	GlobalManager.char_name = $MarginContainer/VBoxContainer/NameEdit.text
	$MarginContainer/VBoxContainer/Next.visible = false
	$MarginContainer/VBoxContainer/VBoxContainer2/Name.visible = false
	$MarginContainer/VBoxContainer/NameEdit.visible = false
	$MarginContainer/VBoxContainer/BeginAdventure.visible = true
	$MarginContainer/VBoxContainer/VBoxContainer2/AdventureName.visible = true
	$MarginContainer/VBoxContainer/AdventureNameEdit.visible = true


func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/InitialBuildEquipment.tscn")
