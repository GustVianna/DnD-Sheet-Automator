extends ClassData
class_name RogueData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Rogue")
	GlobalManager._class_name["Rogue"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
