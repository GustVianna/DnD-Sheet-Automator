extends VBoxContainer

@export var resource : Resource
@export_enum("Unarmed", "Melee", "Ranged") var weapon_type : String

var modifier : int
var proficiency_value := 0
var hit_total

var unarmed_damage_number = 1
var unarmed_damage_faces = 1

func _ready():
	_update_info()
	
func _process(_delta):
	if Engine.get_process_frames() % 300 == 0:
		_update_info()
	pass

func _update_info():
	
	match weapon_type:
		"Unarmed":
			# Hit button display
			proficiency_value = GlobalManager.proficiency
			
			modifier = GlobalManager.ability_scores_resources["Strength"].get_ability_score_total()
			
			hit_total = modifier + proficiency_value
			$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Hit.label_name = str(hit_total)

			# Dmg button display
			$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.visible = false
			$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage.label_name = str(unarmed_damage_faces + GlobalManager.ability_scores_resources["Strength"].get_ability_score_total())
			pass
		"Melee":
			# Hit button display
			if GlobalManager.proficiencies.has(GlobalManager.equipped_weapon) or GlobalManager.proficiencies.has(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["weaponCategory"]):
				proficiency_value = GlobalManager.proficiency
			else:
				proficiency_value = 0
				
			if StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["property"].has("F"):
				var modifiers = [GlobalManager.ability_scores_resources["Strength"].get_ability_score_total(), GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total()]
				modifier = modifiers.max()
			else:
				modifier = GlobalManager.ability_scores_resources["Strength"].get_ability_score_total()
			
			hit_total = modifier + proficiency_value
			$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Hit.label_name = str(hit_total)

			# Dmg button display
			if StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["property"].has("V"):
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.visible = true
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"]) + "\n+" + str(modifier)
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Faces"]) + "\n+" + str(modifier)
			else:
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.visible = false
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"]) + "\n+" + str(modifier)
			pass
		"Ranged":
			if GlobalManager.proficiencies.has(GlobalManager.equipped_weapon) or GlobalManager.proficiencies.has(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["weaponCategory"]):
				proficiency_value = GlobalManager.proficiency
			else:
				proficiency_value = 0
				
			if StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["property"].has("F"):
				var modifiers = [GlobalManager.ability_scores_resources["Strength"].get_ability_score_total(), GlobalManager.ability_scores_resources["Dexterity"].get_ability_score_total()]
				modifier = modifiers.max()
			else:
				modifier = GlobalManager.ability_scores_resources["Strength"].get_ability_score_total()
			
			hit_total = modifier + proficiency_value
			$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Hit.label_name = str(hit_total)

			# Dmg button display
			if StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["property"].has("V"):
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.visible = true
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"]) + "\n+" + str(modifier)
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Faces"]) + "\n+" + str(modifier)
			else:
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage2.visible = false
				$AnimatedButton/MarginContainer/HBoxContainer/HBoxContainer/Damage.label_name = str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"]) + "d" + str(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"]) + "\n+" + str(modifier)
			pass

func _on_button_pressed():
	if $PanelContainer.visible == true:
		$PanelContainer.visible = false
	elif $PanelContainer.visible == false:
		$PanelContainer.visible = true

func _on_hit_pressed():
	match weapon_type:
		"Unarmed":
			GlobalManager.roll_dice(1, 20, hit_total)
			pass
		"Melee":
			GlobalManager.roll_dice(1, 20, hit_total)
			pass
		"Ranged":
			GlobalManager.roll_dice(1, 20, hit_total)
			pass
	

func _on_damage_pressed():
	match weapon_type:
		"Unarmed":
			GlobalManager.roll_dice(1, unarmed_damage_faces, GlobalManager.ability_scores_resources["Strength"].get_ability_score_total())
			pass
		"Melee":
			GlobalManager.roll_dice(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"].to_int(), StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"].to_int(), modifier)
			pass
		"Ranged":
			GlobalManager.roll_dice(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Number"].to_int(), StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg1Faces"].to_int(), modifier)
			pass

func _on_damage_2_pressed():
	match weapon_type:
		"Melee":
			GlobalManager.roll_dice(StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Number"].to_int(), StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["dmg2Faces"].to_int(), modifier)
			pass
