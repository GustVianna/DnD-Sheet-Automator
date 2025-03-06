extends Control

var class_resource : ClassData

func _ready():
	GlobalManager.back_pressed.connect(_on_back_button_pressed)
	$background/ScrollContainer/MarginContainer/VBoxContainer/Name.text = class_resource.name
	$background/ScrollContainer/MarginContainer/VBoxContainer/ConfirmButton.visible = true
	
	#if get_node("/root/InitialBuildClassMain/ClassButtons/VBoxContainer2/VBoxContainer/ClassButton"):
		#for children in get_node("/root/InitialBuildClassMain/ClassButtons/VBoxContainer2/VBoxContainer").get_children():
			#children.menu_popped.connect(_on_menu_popped)
			
	for featureIndex in class_resource.features.size():
		var featureButton = load("res://Scenes/TraitButton.tscn").instantiate()
		featureButton.resource = class_resource.features[featureIndex]
		#featureButton.get_node("AnimatedButton").label_name = class_resource.features[featureIndex].name
		#featureButton.get_node("PanelContainer/TextEdit").text = class_resource.features[featureIndex].description
		$background/ScrollContainer/MarginContainer/VBoxContainer/FeatsContainer.add_child(featureButton)

func _on_back_button_pressed():
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _on_confirm_button_pressed():
	class_resource.class_chosen()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/initial_build_class_main.tscn")

func _on_menu_popped():
	$ScrollContainer/background/ConfirmButton.visible = false
