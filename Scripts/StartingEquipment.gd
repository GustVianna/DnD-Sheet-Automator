extends Control

var isEquipment
# Called when the node enters the scene tree for the first time.

func _ready():
	GlobalManager.back_pressed.connect(_on_back_pressed)

func _on_equipment_pressed():
	isEquipment = true

	var text = StaticData.rolesData["roles"]["barbarian"]["startingEquipment"]["default"]
	$MarginContainer/VBoxContainer/VBoxContainer/TextEdit.text = str(text)

func _on_gold_pressed():
	isEquipment = false
	
	var text = StaticData.rolesData["roles"]["barbarian"]["startingEquipment"]["goldAlternative"]
	$MarginContainer/VBoxContainer/VBoxContainer/TextEdit.text = str(text)


func _on_next_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/AlmostReady.tscn")


func _on_back_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/initial_build_as_increase.tscn") # set to hp next
