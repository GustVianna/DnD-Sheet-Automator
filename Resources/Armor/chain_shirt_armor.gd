extends ArmorData
class_name ChainShirtArmor


func armor_equipped():
	GlobalManager.armorAc = 13 + clamp(GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total(), -5, 2)
	
	GlobalManager.skills["Stealth"].disadvantage = false
	return
