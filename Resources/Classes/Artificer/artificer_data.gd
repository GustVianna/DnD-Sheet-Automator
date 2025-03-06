extends ClassData
class_name ArtificerData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Artificer")
	GlobalManager._class_name["Artificer"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
