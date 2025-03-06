extends Node

var popup = preload("res://Scenes/pop_up.tscn").instantiate()

# REMEMBER MOST OF THESE WILL BE RESOURCES TO THAT THEY CAN BE CHANGED, SAVED, LOADED AND EASILY ACCESSED, THESE ARE JUST PLACEHOLDERS

# Character info
var char_name = "asssss"
var char_age = "27"
var char_height = "1,80"
var char_weight = "80kg"
var char_eyes = "Green"
var char_skin = "Bronze"
var char_hair = "Black"
var char_alignment = "neutral good"
var char_personality = "balblal"
var char_ideals = "balblal"
var char_bonds = "balblal"
var char_flaws = "balblal"
var char_backstory = "balblal"

# Adventure name
var adv_name = ""

# Race
var race : RaceData
var race_traits : Array[RacialTraitData] #Each trait has a name and a description

# Class
var _class_name = {} # Warlock: 3, Artificer: 1
var class_level_total : int
var _class_order = [] # Warlock, Artificer
var _class_subtype = ["Draconic Ancestor"]
var _class_hit_die = 6
var _class_spellcasting = "Charisma"
var _spellcasting_bonus : int
var _spellcasting_saving_throw : int
var _class_traits : Array[ClassTraitData] #Each feature has a name and a description

var feats = []

# Speed
var speed = {"Walk": 30, "Fly": 0, "Swim": 0, "Climb": 0} #There's walk, swim, climb and fly

# HP
var hp_max : int
var hp_temp : int
var hp_cur : int

# Ability Score
var ability_scores = {"Strength": 10, "Dexterity": 14, "Constitution": 12, "Intelligence": 11, "Wisdom": 9, "Charisma": 16}
var ability_scores_resources = {"Strength": AbilityScoreData, "Dexterity": AbilityScoreData, "Constitution": AbilityScoreData, "Intelligence": AbilityScoreData, "Wisdom": AbilityScoreData, "Charisma": AbilityScoreData}
# Skills
var skills = {"Athletics": SkillData, "Acrobatics": SkillData, "Animal_Handling": SkillData, "Arcana": SkillData, "Deception": SkillData, "History": SkillData, "Insight": SkillData, "Intimidation": SkillData, "Investigation": SkillData, "Medicine": SkillData, "Nature": SkillData, "Perception": SkillData, "PerformanceSkill": SkillData, "Persuasion": SkillData, "Religion": SkillData, "Sleight_of_Hand": SkillData, "Stealth": SkillData, "Survival": SkillData} #Each skill will have its own resource which consists of Ability Score + Bonus + Proficiency(if true) + Expertise(if true)

# Weapons
var weapon_equipped := true
var equipped_weapon := "Battleaxe"
var weapon_equipped_left := true
var equipped_weapon_left := "Battleaxe"

# Armor Class
var wearing_armor := false
var equipped_armor : ArmorData
var armor_class : int
var base_ac := 10
var armor_ac : int
var spell_bonus_ac : int
var other_bonus_ac : int

# Inventory (List of every item, each one can be separated into different containers)
var inventory := ["Dagger", "Battleaxe", "Longsword"]

# Gold
var gp : float

# Resistances
var resistances = {"Acid": false, "Bludgeoning": false, "Cold": false, "Fire": false, "Force": false, "Lightning": false, "Necrotic": false, "Piercing": false, "Poison": false, "Psychic": false, "Radiant": false, "Slashing": false, "Thunder": false}

# Conditions
var conditions : Array[ConditionsData]

# Saving Throws
var saving_throws = {"Strength": SavingThrowData, "Dexterity": SavingThrowData, "Constitution": SavingThrowData, "Intelligence": SavingThrowData, "Wisdom": SavingThrowData, "Charisma": SavingThrowData}

# Languages
var languages = ["Common", "Draconic"]

# Background
var background = "Outlander"

# Proficiency
var proficiency : int
		
var proficiencies := ["Dagger", "Simple", "Martial"]

# Controls and Signals
signal change_stat(_stat, _amount)

signal data_updated

signal back_pressed

# Functions
func _ready():
	
	# Class Related
	_get_class_level_total()
	
	# Proficiency
	_get_proficiency()
	
	# Ability Scores
	for ability_score in ability_scores_resources.keys():
		ability_scores_resources[ability_score] = load("res://Resources/AbilityScore/" + ability_score.to_lower() + ".tres")
	
	for element in ability_scores_resources.values():
		element.get_ability_score_total()
	
	#Skills
	for skill in skills.keys():
		skills[skill] = load("res://Resources/Skills/" + skill + ".tres")
		
	for element in skills.values():
		element.get_skill_total()
	
	# Saving Throws
	for saving_throw in saving_throws.keys():
		saving_throws[saving_throw] = load("res://Resources/SavingThrows/st_" + saving_throw.to_lower() + ".tres")
	
	# Spell Casting
	_get_spellcasting()
	
	data_updated.connect(_on_data_updated)

func roll_dice(dice_number, dice_faces, modifier):
	var rng = RandomNumberGenerator.new()
	var num
	var dice_rolls = []
	var total = 0
	
	rng.randomize()
	
	for n in dice_number:
		num = rng.randi_range(1, dice_faces)
		dice_rolls.append(num)
		
	for index in dice_rolls.size():
		total += dice_rolls[index]
		
	total += modifier
	var array = [total, dice_rolls]
	return array

func _call_race_popup_menu(selected_race):
	var imported_race_resource : RaceData = load("res://Resources/Races/" + selected_race + "/" + selected_race + "Data.tres" )
	
	var race_popup = load("res://Scenes/race_popup.tscn").instantiate()
	
	race_popup.race_resource = imported_race_resource
	get_node("/root/Master").add_child(race_popup)
	
func _call_class_popup_menu(selected_class, called_node):
	
	var imported_class_resource : ClassData = load("res://Resources/Classes/" + selected_class + "/" + selected_class.to_lower() + "_data.tres")
	
	var class_popup = load("res://Scenes/class_popup.tscn").instantiate()
	
	class_popup.class_resource = imported_class_resource
	get_node(called_node).add_child(class_popup)

func call_custom_class_popup_menu(called_node):
	var class_popup = load("res://Scenes/custom_class_popup.tscn").instantiate()
	class_popup.class_resource = load("res://Resources/Classes/Custom/custom_class_data.tres")
	get_node(called_node).add_child(class_popup)

func _get_class_level_total():
	var class_level_sum = 0
	for class_level in _class_name.values():
		class_level_sum += class_level
	class_level_total = class_level_sum
	
func _on_data_updated():
	# Class Related
	_get_class_level_total()
	
	# Proficiency
	_get_proficiency()
	
	# Ability Scores
	for ability_score in ability_scores_resources.keys():
		ability_scores_resources[ability_score] = load("res://Resources/AbilityScore/" + ability_score.to_lower() + ".tres")
	
	for element in ability_scores_resources.values():
		element.get_ability_score_total()
	
	#Skills
	for skill in skills.keys():
		skills[skill] = load("res://Resources/Skills/" + skill + ".tres")
		
	for element in skills.values():
		element.get_skill_total()
	
	# Saving Throws
	for saving_throw in saving_throws.keys():
		saving_throws[saving_throw] = load("res://Resources/SavingThrows/st_" + saving_throw.to_lower() + ".tres")
	
	# Spell Casting
	_get_spellcasting()
	
func _get_proficiency():
	_get_class_level_total()
	
	match class_level_total:
		1,2,3,4:
			proficiency = 2
		5,6,7,8:
			proficiency = 3
		9,10,11,12:
			proficiency = 4
		13,14,15,16:
			proficiency = 5
		17,18,19,20:
			proficiency = 6

func _get_ac():
	if wearing_armor:
		armor_class = armor_ac
		
	else:
		armor_class = base_ac + ability_scores_resources["Dexterity"].get_ability_score_total()
	pass

func change_base_stats(stat_name, amount, min_amount, max_amount):
	var new_value = clamp(ability_scores[stat_name] + amount, min_amount, max_amount)
	ability_scores[stat_name] = new_value

func reset_base_stats(stat_name):
	var new_value = 0
	ability_scores[stat_name] = new_value

func _get_spellcasting():
	if _class_order.is_empty():
		return
		
	match _class_order[0]:
		"Sorcerer", "Warlock", "Bard", "Paladin":
			_class_spellcasting = "Charisma"
			_spellcasting_bonus = proficiency + ability_scores_resources["Charisma"].update_ability_scores()
			_spellcasting_saving_throw = 8 + proficiency + ability_scores_resources["Charisma"].update_ability_scores()
			
		"Druid", "Cleric", "Ranger":
			_class_spellcasting = "Wisdom"
			_spellcasting_bonus = proficiency + ability_scores_resources["Wisdom"].update_ability_scores()
			_spellcasting_saving_throw = 8 + proficiency + ability_scores_resources["Wisdom"].update_ability_scores()
			
		"Wizard", "Artificer":
			_class_spellcasting = "Intelligence"
			_spellcasting_bonus = proficiency + ability_scores_resources["Intelligence"].update_ability_scores()
			_spellcasting_saving_throw = 8 + proficiency + ability_scores_resources["Intelligence"].update_ability_scores()
			
func _notification(mobile_input):
	if mobile_input == NOTIFICATION_WM_GO_BACK_REQUEST:
		back_pressed.emit()
