extends Resource
class_name ArmorData

@export var unique_id := ""
@export var name := ""
@export var description := ""
@export var cost : int # In GP
@export var weight : int # In lb.
@export var stealth_disadvantage := false
@export_enum("-", "Str 13", "Str 15") var strength : String
@export_enum("Light Armor", "Medium Armor", "Heavy Armor", "Shield") var category : String


func armor_equipped():
	return
