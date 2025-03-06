extends Panel



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/InitialBuildPage2.tscn");


func _on_button_2_pressed():
	queue_free()
