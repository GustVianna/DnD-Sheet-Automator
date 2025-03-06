extends ArmorData
class_name ChainMailArmor


func armor_equipped():
	GlobalManager.armorAc = 16
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
