extends VBoxContainer

@export var has_modifier := false

# Called when the node enters the scene tree for the first time.
func _ready():
	if has_modifier == true:
		$Button/MarginContainer/HBoxContainer/Button.visible = true
		
	elif has_modifier == false:
		$Button/MarginContainer/HBoxContainer/Button.visible = false
	
