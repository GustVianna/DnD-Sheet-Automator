extends Control

@export var ratio = 0.2
var newLocation : float
var timer : Timer
var timeOut = false
var mouseTouchPosition : float
@onready var panelLocation

func _ready():
	timer = $Timer
	panelLocation = $TextureRect.position.x

func _on_scroll_container_scroll_started():
	timeOut = false
	timer.start()

func _input(event):
	if event is InputEventScreenDrag:
		var difference = mouseTouchPosition - event.position.x
		$TextureRect.position.x = panelLocation - difference #Vector2(difference, 0)
		
	elif event.is_action_released("ui_touch"):
		panelLocation = $TextureRect.position.x
		var percentage = (mouseTouchPosition - event.position.x) / get_viewport().size.x
		if abs(percentage) >= ratio:
			
			if percentage >0:
				newLocation += -get_viewport().size.x #Vector2 (-get_viewport().size.x, newLocation.y)
				
			elif percentage <0:
				newLocation += get_viewport().size.x #Vector2 (get_viewport().size.x, newLocation.y)
				
			_start_tween(newLocation)
			panelLocation = newLocation
			
		else:
			printerr("FOCK")
			_start_tween(newLocation)
			$TextureRect.position.x = panelLocation
			panelLocation = newLocation
		
	elif Input.is_action_just_pressed("ui_touch") and event.is_pressed():
		mouseTouchPosition = event.position.x
		newLocation = panelLocation
		timeOut = false
		timer.start()
	
func _on_timer_timeout():
	timeOut = true

func _start_tween(endPos):
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property($TextureRect, "global_position:x", endPos, 0.5)

func _on_button_pressed():
	newLocation = 0 #Vector2 (0, 0)
	_start_tween(newLocation)
	panelLocation = newLocation
	
func _on_button_2_pressed():
	newLocation = -get_viewport().size.x #Vector2 (-get_viewport().size.x, 0)
	_start_tween(newLocation)
	panelLocation = newLocation

func _on_button_3_pressed():
	newLocation = -get_viewport().size.x * 2 #Vector2 (-get_viewport().size.x * 2, 0)
	_start_tween(newLocation)
	panelLocation = newLocation

func _on_button_4_pressed():
	newLocation = -get_viewport().size.x * 3 #Vector2 (-get_viewport().size.x * 3, 0)
	_start_tween(newLocation)
	panelLocation = newLocation
