extends Button

@export_enum("Primary", "Red") var color_theme : String
@export var label_name : String

func _ready():
	match color_theme:
		"Primary":
			theme = load("res://Assets/Themes/ThemeYellow.tres")
		"Red":
			theme = load("res://Assets/Themes/ThemeRed.tres")
		_:
			theme = load("res://Assets/Themes/TestTheme.tres")
		
	if find_children("Label", "Label"):
		var button_label = find_children("Label", "Label")
		button_label[0].text = label_name
	
	await get_tree().create_timer(0.1).timeout
	pivot_offset.x = size.x/2
	pivot_offset.y = size.y/2
	
	$Shadow.position.x = -6
	$Shadow.position.y = 6


func _process(_delta):
	if Engine.get_process_frames() % 3 == 0:
		if find_children("Label", "Label"):
			var button_label = find_children("Label", "Label")
			button_label[0].text = label_name
	pass

func _on_pressed():
	var tween = create_tween()
	#tween.tween_property(self, "scale", Vector2(0.8,0.8), 0.025)
	tween.parallel()
	tween.tween_property(self, "rotation", -0.05, 0.025) 
	tween.tween_property(self, "scale", Vector2(1.1,1.1), 0.05)
	tween.parallel()
	tween.tween_property(self, "rotation", 0.05, 0.025) 
	tween.tween_property(self, "scale", Vector2(1,1), 0.05)
	tween.parallel()
	tween.tween_property(self, "rotation", 0, 0.025) 

func _on_resized():
	pivot_offset.x = size.x/2
	pivot_offset.y = size.y/2


func _on_button_down():
	pivot_offset = get_local_mouse_position()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.9,0.9), 0.025)


func _on_button_up():
	if !get_tree().get_root().has_node(self.get_path()):
		return
	else:
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1,1), 0.025)
