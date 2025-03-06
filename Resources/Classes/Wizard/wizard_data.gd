extends ClassData
class_name WizardData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Wizard")
	GlobalManager._class_name["Wizard"] = 1
	printerr(GlobalManager._class_order)
	printerr(GlobalManager._class_name)
