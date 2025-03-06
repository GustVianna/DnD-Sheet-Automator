extends Resource
class_name WeaponData

#Properties of the weapons used as Resources

@export var weapon_name : String
@export var weapon_cost : float
@export var weapon_damage : int
@export var weapon_damage_type = {"Bludgeoning": true, "Slashing": true, "Piercing": true, "-": true}
@export var weapon_weight : int
@export var weapon_properties : Array
@export var weapon_category = {"Simple": true, "Martial": true}
@export var weapon_range = {"Melee": true, "Ranged": true}
@export var weapon_proficiency : bool
