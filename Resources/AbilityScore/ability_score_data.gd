extends Resource
class_name AbilityScoreData

@export var ability_name : String
@export var advantage := false
@export var disadvantage := false

@export var added_race = {}
@export var added_feats = {}
@export var added_other = {}

@export var total : int

func get_ability_score_total():
	pass
