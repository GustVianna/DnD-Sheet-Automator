extends Resource
class_name ClassTraitData

@export_enum("Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard", "Artificer", "Custom") var trait_class: String
@export var unique_id := ""
@export var trait_name := ""
@export var description := ""
@export_enum("Passive", "Action", "Bonus Action", "Reaction") var trait_speed: String
@export_range(1, 20, 1) var level

func trigger_trait_effect():
	return
