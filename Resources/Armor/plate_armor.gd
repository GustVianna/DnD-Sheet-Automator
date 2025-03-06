extends ArmorData
class_name PlateArmor


func armor_equipped():
	GlobalManager.armorAc = 18
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
