extends ClassTraitData
class_name DangerSenseData


func trigger_trait_effect():
	
	if GlobalManager.conditions.has(Blinded) or GlobalManager.conditions.has(Deafened) or GlobalManager.conditions.has(Incapacitated):
		return
		
	else:
		GlobalManager.saving_throws.get("Dexterity").advantage = true
		pass
		
	return
