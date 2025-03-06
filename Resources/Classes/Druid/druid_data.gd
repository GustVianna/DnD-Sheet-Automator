extends ClassData
class_name DruidData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Druid")
	GlobalManager._class_name["Druid"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
