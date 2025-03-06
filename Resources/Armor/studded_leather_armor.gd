extends ArmorData
class_name StuddedLeatherArmor


func armor_equipped():
	GlobalManager.armorAc = 12 + GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total()
	
	GlobalManager.skills["Stealth"].disadvantage = false
	return
