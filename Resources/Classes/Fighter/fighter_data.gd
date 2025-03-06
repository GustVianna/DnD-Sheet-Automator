extends ClassData
class_name FighterData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Fighter")
	GlobalManager._class_name["Fighter"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
