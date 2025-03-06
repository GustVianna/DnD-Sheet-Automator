extends Control

@export var feat_resource : FeatData
var pressed
var equipped = false
var pre_req = {"Wizard": 1}

func _ready():
	$Button.text = feat_resource.name
	
	if GlobalManager._class_name.get("Wizard") >= pre_req.get("Wizard"):
		$Button/Unlock.visible = false
		$Button.modulate = Color (1,1,1,1)
		
	else:
		$Button/Unlock.visible = true
		$Button.modulate = Color (1,1,1,0.5)
	

func _on_button_pressed():
	$Button/Panel/RichTextLabel.text = feat_resource.description
	
	if !pressed:
		$Button/Panel.visible = true
		self.custom_minimum_size = Vector2(0, 269)
		pressed = true
		
	else:
		$Button/Panel.visible = false
		self.custom_minimum_size = Vector2(0, 34)
		pressed = false

