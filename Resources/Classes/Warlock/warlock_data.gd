extends ClassData
class_name WarlockData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Warlock")
	GlobalManager._class_name["Warlock"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
