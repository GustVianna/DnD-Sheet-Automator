extends ClassData
class_name MonkData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Monk")
	GlobalManager._class_name["Monk"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
