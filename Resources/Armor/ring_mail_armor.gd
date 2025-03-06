extends ArmorData
class_name RingMailArmor


func armor_equipped():
	GlobalManager.armorAc = 14
	
	GlobalManager.skills["Stealth"].disadvantage = true
	return
