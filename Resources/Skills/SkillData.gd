extends Resource
class_name SkillData

@export var skill_name : String
@export_enum("Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma") var derived_ability: String
@export var proficiency := false
@export var proficiency_bonus = 0
@export var expertise := false
@export var expertise_bonus = 0
@export var advantage := false
@export var disadvantage := false

@export var added_other := 0
@export var other_source : String

@export var total : int

func get_skill_total():
	pass
