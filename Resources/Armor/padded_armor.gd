extends ArmorData
class_name PaddedArmor


func armor_equipped():
	GlobalManager.armorAc = 11 + GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total()
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
