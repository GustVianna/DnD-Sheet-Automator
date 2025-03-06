extends Control

var race_resource : RaceData #The resource will dictate everything

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalManager.back_pressed.connect(_on_back_button_pressed)
	
	if race_resource.unique_id != "custom":
		trigger_default()
		
		$background/ScrollContainer/MarginContainer/Control/Name.text = race_resource.name
		$background/ScrollContainer/MarginContainer/Control/Image.texture = race_resource.image
	
		for traitIndex in race_resource.traits.size():
			var traitButton = load("res://Scenes/RacialTraitButton.tscn").instantiate()
			traitButton.resource = race_resource.traits[traitIndex]
			#traitButton.get_node("AnimatedButton").label_name = race_resource.traits[traitIndex].trait_name
			#traitButton.get_node("PanelContainer/TextEdit").text = race_resource.traits[traitIndex].description
			$background/ScrollContainer/MarginContainer/Control/FeatsContainer.add_child(traitButton)
			
	else:
		trigger_custom()

func trigger_custom():
	$background/ScrollContainer/MarginContainer/Control/Name.visible = false
	$background/ScrollContainer/MarginContainer/Control/CustomName.visible = true
	$background/ScrollContainer/MarginContainer/Control/FeatsContainer/MarginContainer/Add.visible = true
	
func trigger_default():
	$background/ScrollContainer/MarginContainer/Control/Name.visible = true
	$background/ScrollContainer/MarginContainer/Control/CustomName.visible = false
	$background/ScrollContainer/MarginContainer/Control/FeatsContainer/MarginContainer/Add.visible = false

func _on_back_button_pressed():
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _on_confirm_button_pressed():
# go to new scene to classes
	race_resource.race_chosen()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/initial_build_class_main.tscn")


func _on_add_pressed():
	await get_tree().create_timer(0.1).timeout
	var trait_button = load("res://Scenes/RacialCustomTraitButton.tscn").instantiate()
	$background/ScrollContainer/MarginContainer/Control/FeatsContainer.add_child(trait_button)
	
	
	$background/ScrollContainer/MarginContainer/Control/FeatsContainer.move_child($background/ScrollContainer/MarginContainer/Control/FeatsContainer/MarginContainer, $background/ScrollContainer/MarginContainer/Control/FeatsContainer.get_child_count())

func _on_custom_name_text_changed(new_text):
	race_resource.name = new_text
	ResourceSaver.save(race_resource, "res://Resources/Races/CustomRace/CustomRaceData.tres")
	printerr(race_resource.name)
