extends Control

@export var feat_resource : FeatData
var pressed
var equipped = false
var pre_req = "Level 1"

func _ready():
	$Button.text = feat_resource.name
	
	if GlobalManager.cl
	

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

