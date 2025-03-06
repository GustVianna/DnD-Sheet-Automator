extends ClassData
class_name BarbarianData

func class_chosen():
	for element in features:
		GlobalManager._class_traits.append(element)
		
	GlobalManager._class_order.append("Barbarian")
	GlobalManager._class_name["Barbarian"] = 1
	
	for class_trait in GlobalManager._class_traits:
		class_trait.trigger_trait_effect()
