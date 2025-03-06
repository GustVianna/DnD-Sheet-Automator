extends ClassTraitData
class_name UnarmoredDefenseData


func trigger_trait_effect():
	if GlobalManager.wearing_armor == false:
		GlobalManager.base_ac = 10 + GlobalManager.ability_scores_resources["Constitution"].get_ability_score_total()
		
	elif GlobalManager.wearing_armor == true:
		GlobalManager.base_ac = 10
	return
