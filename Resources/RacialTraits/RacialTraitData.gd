extends Resource
class_name RacialTraitData

@export var unique_id := ""
@export var trait_name := ""
@export var description := ""
@export_enum("Passive", "Action", "Bonus Action", "Reaction") var trait_speed: String

func trigger_trait_effect():
	return
