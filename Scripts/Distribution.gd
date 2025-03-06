extends Control

var stats_parent = "/root/Control/Background/Stats/StatButtons/HBoxContainer/"

@onready var charisma = get_node(stats_parent + "CHA/VBoxContainer/StatLabel")
@onready var dexterity = get_node(stats_parent + "DEX/VBoxContainer/StatLabel")
@onready var strength = get_node(stats_parent + "STR/VBoxContainer/StatLabel")
@onready var constitution = get_node(stats_parent + "CON/VBoxContainer/StatLabel")
@onready var intelligence = get_node(stats_parent + "INT/VBoxContainer/StatLabel")
@onready var wisdom = get_node(stats_parent + "WIS/VBoxContainer/StatLabel")

var button_index := 0

func _on_distribution_options_pressed():
	
	button_index+= 1
	
	if button_index >2:
		button_index = 0
		
	match button_index:
		0:
			$DistributionOptions.text = "Point Buy"
		1:
			$DistributionOptions.text = "Roll Stats"
		2:
			$DistributionOptions.text = "Custom"
			
func _on_recommended_pressed():
	match GlobalManager._class_name:
		"Warlock":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Sorcerer":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Wizard":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Fighter":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Paladin":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Ranger":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Barbarian":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Cleric":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Artificer":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Monk":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Bard":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Druid":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
		"Rogue":
			charisma.text = "17"
			dexterity.text = "17"
			strength.text = "17"
			constitution.text = "17"
			intelligence.text = "17"
			wisdom.text = "17"
