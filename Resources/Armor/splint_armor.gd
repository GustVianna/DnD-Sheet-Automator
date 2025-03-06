extends ArmorData
class_name SplintArmor


func armor_equipped():
	GlobalManager.armorAc = 17
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
