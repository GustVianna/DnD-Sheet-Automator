extends RaceData
class_name GenasiData


func race_chosen():
	for element in traits:
		GlobalManager.race_traits.append(element)
		
	GlobalManager.race = self
