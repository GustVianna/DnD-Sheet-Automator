extends ClassData
class_name CustomClassData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append(name)
	GlobalManager._class_name[name] = 1
