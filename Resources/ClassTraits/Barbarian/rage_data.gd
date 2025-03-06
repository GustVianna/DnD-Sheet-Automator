extends ClassTraitData
class_name RageData

@export var uses : int
@export var rage_damage : int
@export var is_raging := false

func trigger_trait_effect():
	if is_raging:
		is_raging = false
		GlobalManager.resistances["Bludgeoning"] = false
		GlobalManager.resistances["Slashing"] = false
		GlobalManager.resistances["Piercing"] = false
		return
	
	elif is_raging == false:
		is_raging = true
		GlobalManager.resistances["Bludgeoning"] = true
		GlobalManager.resistances["Slashing"] = true
		GlobalManager.resistances["Piercing"] = true
