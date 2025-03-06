extends ArmorData
class_name LeatherArmor


func armor_equipped():
	GlobalManager.armorAc = 11 + GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total()
	
	GlobalManager.skills["Stealth"].disadvantage = false
	return
