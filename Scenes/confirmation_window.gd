extends PanelContainer

signal confirm
signal cancel

func _on_ok_pressed():
	confirm.emit()

func _on_cancel_pressed():
	cancel.emit()
	queue_free()
