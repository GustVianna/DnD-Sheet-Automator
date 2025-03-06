extends ArmorData
class_name ShieldArmor


func armor_equipped():
	GlobalManager.armorAc += 2
	
	GlobalManager.skills["Stealth"].disadvantage = false
	return
