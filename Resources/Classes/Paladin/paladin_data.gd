extends ClassData
class_name PaladinData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Paladin")
	GlobalManager._class_name["Paladin"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
