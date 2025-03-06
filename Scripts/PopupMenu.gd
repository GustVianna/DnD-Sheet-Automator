extends Panel


func _ready():
	$Label.text = "Class: " + GlobalManager._class_name
