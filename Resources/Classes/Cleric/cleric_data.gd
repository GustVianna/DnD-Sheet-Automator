extends ClassData
class_name ClericData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Cleric")
	GlobalManager._class_name["Cleric"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
