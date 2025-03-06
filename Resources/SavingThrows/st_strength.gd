extends SavingThrowData
class_name STStrength

var added_other_sum : int
var proficiency_bonus : int

func get_saving_throw_total():
	
	if added_other.is_empty() == false:
		added_other_sum = added_other.values().reduce(sum)
	else:
		added_other_sum = 0
	
	if proficiency == true:
		proficiency_bonus = GlobalManager.proficiency
		
	else:
		proficiency_bonus = 0
	
	total = GlobalManager.ability_scores_resources["Strength"].get_ability_score_total() + added_other_sum + proficiency_bonus
	return total

func sum(accum):
	return accum
