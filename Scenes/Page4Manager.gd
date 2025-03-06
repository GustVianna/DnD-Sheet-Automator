extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$ScrollContainer4/Scroll/VBoxContainer/HBoxContainer/Button.text = GlobalManager._class_spellcasting
	$ScrollContainer4/Scroll/VBoxContainer/HBoxContainer/Button2.text = str(GlobalManager._spellcasting_bonus)
	$ScrollContainer4/Scroll/VBoxContainer/HBoxContainer/Button3.text = str(GlobalManager._spellcasting_saving_throw)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
