extends ClassData
class_name BardData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Bard")
	GlobalManager._class_name["Bard"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
