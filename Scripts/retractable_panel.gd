extends PanelContainer

var closed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if closed == true:
		$MarginContainer/VBoxContainer/Contents.visible = true
		$MarginContainer/VBoxContainer/HBoxContainer/TextureRect.flip_v = false
		closed = false
	elif closed == false:
		$MarginContainer/VBoxContainer/Contents.visible = false
		$MarginContainer/VBoxContainer/HBoxContainer/TextureRect.flip_v = true
		closed = true
