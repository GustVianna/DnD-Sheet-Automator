extends ArmorData
class_name HideArmor


func armor_equipped():
	GlobalManager.armorAc = 12 + clamp(GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total(), -5, 2)
	
	GlobalManager.skills["Stealth"].disadvantage = false
	return
