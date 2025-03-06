extends VBoxContainer

@export var resource : Resource

func _ready():
	# Setup
	if resource != null:
		$AnimatedButton.label_name = resource.trait_name
		$PanelContainer/MarginContainer/VBoxContainer/TextEdit.text = resource.description
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Level.text = "Lv." + str(resource.level)
		$AnimatedButton/MarginContainer/HBoxContainer/Level/Level.text = "Lv." + str(resource.level)
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Speed.text = resource.trait_speed
		
		if GlobalManager._class_name.has(resource.trait_class):
			if resource.level > GlobalManager._class_name.get(resource.trait_class):
				$AnimatedButton/MarginContainer/HBoxContainer/Level/MarginContainer/Lock.visible = true
			
			else:
				$AnimatedButton/MarginContainer/HBoxContainer/Level/MarginContainer/Lock.visible = false
		
		else:
				$AnimatedButton/MarginContainer/HBoxContainer/Level/MarginContainer/Lock.visible = true
		
func _on_button_pressed():
	if $PanelContainer.visible == true:
		$PanelContainer.visible = false
		$AnimatedButton/MarginContainer/HBoxContainer/TextureRect.flip_v = false
	elif $PanelContainer.visible == false:
		$PanelContainer.visible = true
		$AnimatedButton/MarginContainer/HBoxContainer/TextureRect.flip_v = true
