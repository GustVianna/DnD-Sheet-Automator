extends RaceData
class_name LoxodonData


func race_chosen():
	for element in traits:
		GlobalManager.race_traits.append(element)
		
	GlobalManager.race = self
