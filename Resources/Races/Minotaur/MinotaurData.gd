extends RaceData
class_name MinotaurData


func race_chosen():
	for element in traits:
		GlobalManager.race_traits.append(element)
		
	GlobalManager.race = self
