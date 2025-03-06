extends Node

var path = "user://"
var save_file_name1 = "SaveData1.data"
var save_file_name2 = "SaveData2.data"
var save_file_name3 = "SaveData3.data"
var save_file_name4 = "SaveData4.data"

var currentSave

signal save_finished
signal load_finished

func save_game():
	var file = FileAccess.open(path + currentSave, FileAccess.WRITE)
	
	var saved_data = {}
	# Char info
	saved_data["char_name"] = GlobalManager.char_name
	saved_data["char_age"] = GlobalManager.char_age
	saved_data["char_height"] = GlobalManager.char_height
	saved_data["char_weight"] = GlobalManager.char_weight
	saved_data["char_eyes"] = GlobalManager.char_eyes
	saved_data["char_skin"] = GlobalManager.char_skin
	saved_data["char_hair"] = GlobalManager.char_hair
	saved_data["char_alignment"] = GlobalManager.char_alignment
	saved_data["char_personality"] = GlobalManager.char_personality
	saved_data["char_ideals"] = GlobalManager.char_ideals
	saved_data["char_bonds"] = GlobalManager.char_bonds
	saved_data["char_flaws"] = GlobalManager.char_flaws
	saved_data["char_backstory"] = GlobalManager.char_backstory
	
	# Adventure Name
	saved_data["adv_name"] = GlobalManager.adv_name
	
	# Race
	saved_data["race.resource_path"] = GlobalManager.race.resource_path
	saved_data["race_traits"] = []
	for index in GlobalManager.race_traits.size():
		saved_data["race_traits"].append(GlobalManager.race_traits[index].resource_path)
	
	# Class
	saved_data["_class_name"] = GlobalManager._class_name
	saved_data["class_level_total"] = GlobalManager.class_level_total
	saved_data["_class_order"] = GlobalManager._class_order
	saved_data["_class_subtype"] = GlobalManager._class_subtype
	saved_data["_class_hit_die"] = GlobalManager._class_hit_die
	saved_data["_class_spellcasting"] = GlobalManager._class_spellcasting
	saved_data["_spellcasting_bonus"] = GlobalManager._spellcasting_bonus
	saved_data["_spellcasting_saving_throw"] = GlobalManager._spellcasting_saving_throw
	saved_data["_class_traits"] = []
	for index in GlobalManager._class_traits.size():
		saved_data["_class_traits"].append(GlobalManager._class_traits[index].resource_path)
	
	# Feats
	saved_data["feats"] = GlobalManager.feats
	
	# Speed
	saved_data["speed"] = GlobalManager.speed
	
	# HP
	saved_data["hp_max"] = GlobalManager.hp_max
	saved_data["hp_temp"] = GlobalManager.hp_temp
	saved_data["hp_cur"] = GlobalManager.hp_cur
	
	# Ability Scores
	saved_data["ability_scores"] = GlobalManager.ability_scores
	saved_data["ability_scores_resources"] = []
	for index in GlobalManager.ability_scores_resources.values().size():
		saved_data["ability_scores_resources"].append(GlobalManager.ability_scores_resources.values()[index].resource_path)
		
	# Skills
	saved_data["skills"] = []
	for index in GlobalManager.skills.values().size():
		saved_data["skills"].append(GlobalManager.skills.values()[index].resource_path)
	
	# Inventory
	
	# Weapons
	saved_data["weapon_equipped"] = GlobalManager.weapon_equipped
	saved_data["equipped_weapon"] = GlobalManager.equipped_weapon
	saved_data["weapon_equipped_left"] = GlobalManager.weapon_equipped_left
	saved_data["equipped_weapon_left"] = GlobalManager.equipped_weapon_left
	
	# AC
	saved_data["wearing_armor"] = GlobalManager.wearing_armor
	if GlobalManager.equipped_armor:
		saved_data["equipped_armor.resource_path"] = GlobalManager.equipped_armor.resource_path
	saved_data["armor_class"] = GlobalManager.armor_class
	saved_data["base_ac"] = GlobalManager.base_ac
	saved_data["armor_ac"] = GlobalManager.armor_ac
	saved_data["spell_bonus_ac"] = GlobalManager.spell_bonus_ac
	saved_data["other_bonus_ac"] = GlobalManager.other_bonus_ac
	
	# Resistances
	saved_data["resistances"] = GlobalManager.resistances
	
	# Conditions
	saved_data["conditions"] = []
	for index in GlobalManager.conditions.size():
		saved_data["conditions"].append(GlobalManager.conditions[index].resource_path)
	
	# Saving Throws
	saved_data["saving_throws"] = []
	for index in GlobalManager.saving_throws.values().size():
		saved_data["saving_throws"].append(GlobalManager.saving_throws.values()[index].resource_path)
	
	# Languages
	saved_data["languages"] = GlobalManager.languages
	
	# Background
	saved_data["background"] = GlobalManager.background
	
	# Proficiency
	saved_data["proficiency"] = GlobalManager.proficiency
	
	var json = JSON.stringify(saved_data)
	
	file.store_string(json)
	file.close()
	
	save_finished.emit()
	
func load_game():
	var file = FileAccess.open(path + currentSave, FileAccess.READ)
	
	var json = file.get_as_text()
	
	var saved_data = JSON.parse_string(json)
	
	# Char info
	GlobalManager.char_name = saved_data["char_name"]
	GlobalManager.char_age = saved_data["char_age"]
	GlobalManager.char_height = saved_data["char_height"]
	GlobalManager.char_weight = saved_data["char_weight"]
	GlobalManager.char_eyes = saved_data["char_eyes"]
	GlobalManager.char_skin = saved_data["char_skin"]
	GlobalManager.char_hair = saved_data["char_hair"]
	GlobalManager.char_alignment = saved_data["char_alignment"]
	GlobalManager.char_personality = saved_data["char_personality"]
	GlobalManager.char_ideals = saved_data["char_ideals"]
	GlobalManager.char_bonds = saved_data["char_bonds"]
	GlobalManager.char_flaws = saved_data["char_flaws"]
	GlobalManager.char_backstory = saved_data["char_backstory"]
	
	# Adventure
	GlobalManager.adv_name = saved_data["adv_name"]
	
	# Race
	GlobalManager.race = load(saved_data["race.resource_path"])
	for index in saved_data["race_traits"].size():
		GlobalManager.race_traits.append(load(saved_data["race_traits"][index]))
	
	# Class
	GlobalManager._class_name = saved_data["_class_name"]
	GlobalManager.class_level_total = saved_data["class_level_total"]
	GlobalManager._class_order = saved_data["_class_order"]
	GlobalManager._class_subtype = saved_data["_class_subtype"]
	GlobalManager._class_hit_die = saved_data["_class_hit_die"]
	GlobalManager._class_spellcasting = saved_data["_class_spellcasting"]
	GlobalManager._spellcasting_bonus = saved_data["_spellcasting_bonus"]
	GlobalManager._spellcasting_saving_throw = saved_data["_spellcasting_saving_throw"]
	for index in saved_data["_class_traits"].size():
		GlobalManager._class_traits.append(load(saved_data["_class_traits"][index]))
	
	# Feats
	GlobalManager.feats = saved_data["feats"]
	
	# Speed
	GlobalManager.speed = saved_data["speed"]
	
	# HP
	GlobalManager.hp_max = saved_data["hp_max"]
	GlobalManager.hp_temp = saved_data["hp_temp"]
	GlobalManager.hp_cur = saved_data["hp_cur"]
	
	# Ability Scores
	GlobalManager.ability_scores = saved_data["ability_scores"]
	for index in saved_data["ability_scores_resources"].size():
		GlobalManager.ability_scores_resources.keys()[index] = load(saved_data["ability_scores_resources"][index])
	
	# Skills
	for index in saved_data["skills"].size():
		GlobalManager.skills.keys()[index] = load(saved_data["skills"][index])
	
	# Weapons
	GlobalManager.weapon_equipped = saved_data["weapon_equipped"]
	GlobalManager.equipped_weapon = saved_data["equipped_weapon"]
	GlobalManager.weapon_equipped_left = saved_data["weapon_equipped_left"]
	GlobalManager.equipped_weapon_left = saved_data["equipped_weapon_left"]
	
	# AC
	GlobalManager.wearing_armor = saved_data["wearing_armor"]
	if GlobalManager.wearing_armor:
		GlobalManager.equipped_armor = load(saved_data["equipped_armor.resource_path"])
	GlobalManager.armor_class = saved_data["armor_class"]
	GlobalManager.base_ac = saved_data["base_ac"]
	GlobalManager.armor_ac = saved_data["armor_ac"]
	GlobalManager.spell_bonus_ac = saved_data["spell_bonus_ac"]
	GlobalManager.other_bonus_ac = saved_data["other_bonus_ac"]
	
	# Resistances
	GlobalManager.resistances = saved_data["resistances"]
	
	# Conditions
	for index in saved_data["conditions"].size():
		GlobalManager.conditions.append(load(saved_data["conditions"][index]))
	
	# Saving Throw
	for index in saved_data["saving_throws"].size():
		GlobalManager.saving_throws.keys()[index] = load(saved_data["saving_throws"][index])
	
	# Languages
	GlobalManager.languages = saved_data["languages"]
	
	# Background
	GlobalManager.background = saved_data["background"]
	
	# Proficiency
	GlobalManager.proficiency = saved_data["proficiency"]
	
	file.close()
	
	load_finished.emit()
	
func delete_save():
	if FileAccess.file_exists(path + currentSave):
		DirAccess.remove_absolute(path + currentSave)
