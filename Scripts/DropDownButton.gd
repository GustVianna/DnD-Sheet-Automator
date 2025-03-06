extends VBoxContainer

var buttonChild
var panelChild

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).pressed.connect(_on_button_pressed)
	panelChild = get_child(1)


func _on_button_pressed():
	if panelChild.visible == false:
		panelChild.visible = true
		
	elif panelChild.visible == true:
		panelChild.visible = false
