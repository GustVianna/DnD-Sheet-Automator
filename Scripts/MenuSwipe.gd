extends Control

var target = 30
var startPos : Vector2
var curPos : Vector2
var swiping = false

var threshold = 30
static var canSwipe = true
var scrolling_object

var menuStartPos : Vector2
var menuCurPos : Vector2

var page
signal pageChanged(pageNumber)

func _ready():
	
	GlobalManager._on_data_updated()
	
	for scroll_children in get_tree().get_nodes_in_group("ScrollContainer"):
		scroll_children.scroll_started.connect(_on_scroll_started.bind(scroll_children))
		scroll_children.scroll_ended.connect(_on_scroll_ended.bind(scroll_children))
		
	_check_page_number()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_touch"):
		if !swiping:
			swiping = true
			startPos = get_global_mouse_position()
			
			menuStartPos = position
			
			$Timer.start()
			
	if Input.is_action_pressed("ui_touch"):
		if swiping && canSwipe:
			
			curPos = get_global_mouse_position()
			menuCurPos = menuStartPos + Vector2((curPos.x - startPos.x), position.y)
			
			if abs(startPos.x-curPos.x) >= target:
				for children in get_tree().get_nodes_in_group("ScrollContainer"):
					children.get_child(0).mouse_filter = 0
					
				position.x = clamp(menuCurPos.x, ((-$Page1.size.x/4) * 13), $Page1.size.x/4)
		
	else:
		swiping = false
		
		for children in get_tree().get_nodes_in_group("ScrollContainer"):
			children.get_child(0).mouse_filter = 1
		
	if Input.is_action_just_released("ui_touch"):
		$Timer.paused = true
		
		for children in get_tree().get_nodes_in_group("ScrollContainer"):
			children.get_child(0).mouse_filter = 1
		
		if (abs(startPos.x-curPos.x) >= $Page1.size.x/2 && position.x > (-$Page1.size.x*3) && position.x < 0) || ($Timer.time_left > 0 && position.x > (-$Page1.size.x*3) && position.x < 0 && abs(startPos.x-curPos.x) >= 20):
			
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
			tween.tween_property(self, "position:x", menuStartPos.x - ($Page1.size.x * ((startPos.x-curPos.x) /abs(startPos.x-curPos.x))), 0.05)
			menuStartPos = position
			
			await tween.finished
			_check_page_number()
			
		else:
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
			tween.tween_property(self, "position:x", menuStartPos.x, 0.05)
			
			await tween.finished
			position = menuStartPos
			_check_page_number()
			
		$Timer.paused = false
		$Timer.stop()
		
	$"../Dice".label_name = str(Engine.get_frames_per_second())
	#if Engine.get_process_frames() % 300 == 0:
		#pass

func _on_scroll_started(scroll_children):
	scrolling_object = scroll_children
	canSwipe = false
	
func _on_scroll_ended(scroll_children):
	if scroll_children == scrolling_object:
		canSwipe = true

func _on_stats_pressed():
	# Button animation
	var button_tween = create_tween()
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "scale", Vector2(0.9,0.9), 0.025)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "rotation", -0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "scale", Vector2(1.1,1.1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "rotation", 0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "scale", Vector2(1,1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Stats/MarginContainer", "rotation", 0, 0.025) 
	
	
	
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "position:x", 0, 0.14)
	
	await tween.finished
	menuStartPos = position
	_check_page_number()

func _on_inventory_pressed():
	# Button animation
	var button_tween = create_tween()
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "scale", Vector2(0.9,0.9), 0.025)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "rotation", -0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "scale", Vector2(1.1,1.1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "rotation", 0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "scale", Vector2(1,1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Inventory/MarginContainer", "rotation", 0, 0.025) 
	
	
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "position:x", -$Page1.size.x, 0.14)
	await tween.finished
	menuStartPos = position
	_check_page_number()

func _on_combat_pressed():
	# Button animation
	var button_tween = create_tween()
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "scale", Vector2(0.9,0.9), 0.025)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "rotation", -0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "scale", Vector2(1.1,1.1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "rotation", 0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "scale", Vector2(1,1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Combat/MarginContainer", "rotation", 0, 0.025) 
	
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "position:x", -$Page1.size.x * 2, 0.14)
	await tween.finished
	menuStartPos = position
	_check_page_number()

func _on_spells_pressed():
	# Button animation
	var button_tween = create_tween()
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "scale", Vector2(0.9,0.9), 0.025)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "rotation", -0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "scale", Vector2(1.1,1.1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "rotation", 0.04, 0.025) 
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "scale", Vector2(1,1), 0.05)
	button_tween.parallel()
	button_tween.tween_property($"../HBoxContainer/Spells/MarginContainer", "rotation", 0, 0.025) 
	
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "position:x", -$Page1.size.x * 3, 0.14)
	await tween.finished
	menuStartPos = position
	_check_page_number()
	
func _check_page_number():
	match position.x:
		var x when x<=0 && x> (-$Page1.size.x):
			page = 1
			pageChanged.emit(1)
			$"../HBoxContainer/Stats".theme = load("res://Assets/Themes/TestTheme.tres")
			$"../HBoxContainer/Inventory".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Combat".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Spells".theme = load("res://Assets/Themes/ThemeDark.tres")
			
		var x when x<=(-$Page1.size.x) && x > (-$Page1.size.x *2):
			page = 2
			pageChanged.emit(2)
			$"../HBoxContainer/Stats".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Inventory".theme = load("res://Assets/Themes/TestTheme.tres")
			$"../HBoxContainer/Combat".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Spells".theme = load("res://Assets/Themes/ThemeDark.tres")
			
		var x when x<=(-$Page1.size.x *2) && x> (-$Page1.size.x *3):
			page = 3
			pageChanged.emit(3)
			$"../HBoxContainer/Stats".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Inventory".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Combat".theme = load("res://Assets/Themes/TestTheme.tres")
			$"../HBoxContainer/Spells".theme = load("res://Assets/Themes/ThemeDark.tres")
			
		var x when x<= (-$Page1.size.x *3):
			page = 4
			pageChanged.emit(4)
			$"../HBoxContainer/Stats".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Inventory".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Combat".theme = load("res://Assets/Themes/ThemeDark.tres")
			$"../HBoxContainer/Spells".theme = load("res://Assets/Themes/TestTheme.tres")
