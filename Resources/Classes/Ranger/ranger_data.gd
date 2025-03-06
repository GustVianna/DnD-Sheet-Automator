extends ClassData
class_name RangerData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Ranger")
	GlobalManager._class_name["Ranger"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
