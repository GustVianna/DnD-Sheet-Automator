extends ClassData
class_name SorcererData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Sorcerer")
	GlobalManager._class_name["Sorcerer"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
