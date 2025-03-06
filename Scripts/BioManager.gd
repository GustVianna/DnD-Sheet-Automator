extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_top_bio_info()
	_update_bio_screen_info()
	$"../ColorRect".z_index = 3
	$BioPanel.size.y = get_viewport().size.y
	$BioPanel.position.y = -get_viewport().size.y

func _process(_delta):
	if Engine.get_process_frames() % 300 == 0:
		_update_top_bio_info()
	pass

func _on_close_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", 0, 0.25)
	$"../ColorRect".z_index = 3

func _on_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", get_viewport().size.y, 0.25)
	$"../ColorRect".z_index = 5
	
func _update_top_bio_info():
	$MarginContainer/HBoxContainer/VBoxContainer/LineEdit.text = GlobalManager.char_name
	
	# HP bar
	$MarginContainer/HBoxContainer/VBoxContainer/HpBar.max_value = GlobalManager.hp_max
	$MarginContainer/HBoxContainer/VBoxContainer/HpBar.value = GlobalManager.hp_cur
	
	$MarginContainer/HBoxContainer/VBoxContainer/HpBar/HBoxContainer/TempHpBar.value = GlobalManager.hp_temp
	if GlobalManager.hp_temp <= 0:
		$MarginContainer/HBoxContainer/VBoxContainer/HpBar/HBoxContainer/TempHpBar/MarginContainer/TempHp.text = ""
	else:
		$MarginContainer/HBoxContainer/VBoxContainer/HpBar/HBoxContainer/TempHpBar/MarginContainer/TempHp.text = str(GlobalManager.hp_temp)
	
	$MarginContainer/HBoxContainer/VBoxContainer/HpBar/HBoxContainer/MarginContainer/HP.text = str(GlobalManager.hp_cur) + "/" + str(GlobalManager.hp_max)
	
	# Class Buttons
	for child_index in $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/ClassButtons.get_child_count():
		$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/ClassButtons.get_child(child_index).queue_free()
	
	for index in GlobalManager._class_name.keys().size():
		var class_button = Button.new()
		class_button.add_theme_font_size_override("font_size", 20)
		class_button.text_overrun_behavior = 3
		class_button.size_flags_horizontal = 1
		class_button.text = GlobalManager._class_name.keys()[index] + "\n" + str(GlobalManager._class_name.values()[index])
		$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/ClassButtons.add_child(class_button)
		
	# Bio Dragdown
	$BioPanel.position.y = -size.y
	

func _update_bio_screen_info():
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Name.text = GlobalManager.char_name
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Age.text = GlobalManager.char_age
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Height.text = GlobalManager.char_height
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Weight.text = GlobalManager.char_weight
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Eyes.text = GlobalManager.char_eyes
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Skin.text = GlobalManager.char_skin
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Hair.text = GlobalManager.char_hair
	$BioPanel/VBoxContainer/ScrollContainer/ScrollElements/VBoxContainer/WrittenMenus/ShortTexts/Alignment.text = GlobalManager.char_alignment


func _on_short_rest_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	
	popup_confirmation.confirm.connect(execute_short_rest)
	
	pass # Replace with function body.

func execute_short_rest():
	var video = load("res://Scenes/campfire_video.tscn").instantiate()
	add_child(video)
	# Do short rest things
	get_node("ConfirmationWindow").queue_free()
	pass

func _on_long_rest_pressed():
	var popup_confirmation = load("res://Scenes/confirmation_window.tscn").instantiate()
	add_child(popup_confirmation)
	
	popup_confirmation.confirm.connect(execute_long_rest)
	pass # Replace with function body.

func execute_long_rest():
	var video = load("res://Scenes/campfire_video.tscn").instantiate()
	add_child(video)
	# Do long rest things
	get_node("ConfirmationWindow").queue_free()
	pass
