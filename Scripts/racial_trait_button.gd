extends VBoxContainer

@export var resource : Resource

func _ready():
	# Setup
	if $AnimatedButton.label_name == "":
		$AnimatedButton.label_name = resource.trait_name
	$PanelContainer/MarginContainer/VBoxContainer/TextEdit.text = resource.description
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Speed.text = resource.trait_speed
	
func _on_button_pressed():
	if $PanelContainer.visible == true:
		$PanelContainer.visible = false
		$AnimatedButton/MarginContainer/HBoxContainer/TextureRect.flip_v = false
	elif $PanelContainer.visible == false:
		$PanelContainer.visible = true
		$AnimatedButton/MarginContainer/HBoxContainer/TextureRect.flip_v = true
