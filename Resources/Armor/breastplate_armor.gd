extends ArmorData
class_name BreastplateArmor


func armor_equipped():
	GlobalManager.armorAc = 14 + clamp(GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total(), -5, 2)
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
