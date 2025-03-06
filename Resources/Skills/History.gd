extends SkillData
class_name History

func get_skill_total():
	if expertise:
		expertise_bonus = GlobalManager.proficiency
	
	if proficiency:
		proficiency_bonus = GlobalManager.proficiency
	
	total = GlobalManager.ability_scores_resources[derived_ability].get_ability_score_total() + proficiency_bonus + expertise_bonus + added_other
	return total

