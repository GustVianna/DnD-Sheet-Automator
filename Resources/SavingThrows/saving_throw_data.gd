extends Resource
class_name SavingThrowData

@export var ability_name : String
@export var advantage := false
@export var disadvantage := false

@export var proficiency := false
@export var added_other = {}

@export var total : int

func get_saving_throw_total():
	pass
