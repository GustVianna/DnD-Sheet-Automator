extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for index in get_tree().get_nodes_in_group("Stats").size():
		if GlobalManager.ability_scores_resources.values()[index].get_ability_score_total() > 0:
			get_tree().get_nodes_in_group("Mod")[index].text = "+" + str(GlobalManager.ability_scores_resources.values()[index].get_ability_score_total())
		
		elif GlobalManager.ability_scores_resources.values()[index].get_ability_score_total() < 0:
			get_tree().get_nodes_in_group("Mod")[index].text = str(GlobalManager.ability_scores_resources.values()[index].get_ability_score_total())
			
		elif GlobalManager.ability_scores_resources.values()[index].get_ability_score_total() == 0:
			get_tree().get_nodes_in_group("Mod")[index].text = str(GlobalManager.ability_scores_resources.values()[index].get_ability_score_total())
		
		get_tree().get_nodes_in_group("Stats")[index].text = str(GlobalManager.ability_scores.values()[index])
	
	# Saving Throws
	for index in get_tree().get_nodes_in_group("SavingThrowRoll").size():
		if GlobalManager.saving_throws.values()[index].get_saving_throw_total() > 0:
			get_tree().get_nodes_in_group("SavingThrowRoll")[index].text = "+" + str(GlobalManager.saving_throws.values()[index].get_saving_throw_total())
		
		elif GlobalManager.saving_throws.values()[index].get_saving_throw_total() < 0:
			get_tree().get_nodes_in_group("SavingThrowRoll")[index].text = str(GlobalManager.saving_throws.values()[index].get_saving_throw_total())
			
		elif GlobalManager.saving_throws.values()[index].get_saving_throw_total() == 0:
			get_tree().get_nodes_in_group("SavingThrowRoll")[index].text = str(GlobalManager.saving_throws.values()[index].get_saving_throw_total())
	
	# Racial traits
	for traitIndex in GlobalManager.race_traits.size():
		var traitButton = load("res://Scenes/RacialTraitButton.tscn").instantiate()
		traitButton.resource = GlobalManager.race_traits[traitIndex]
		#traitButton.get_node("AnimatedButton").label_name = GlobalManager.race_traits[traitIndex].name
		#traitButton.get_node("PanelContainer/MarginContainer/VBoxContainer/TextEdit").text = GlobalManager.race_traits[traitIndex].description
		$ScrollContainer1/Scroll/VBoxContainer/RacialTraits/MarginContainer/VBoxContainer/Contents.add_child(traitButton)
		
	# Class traits
	for classIndex in GlobalManager._class_traits.size():
		var _class_traitButton = load("res://Scenes/TraitButton.tscn").instantiate()
		_class_traitButton.resource = GlobalManager._class_traits[classIndex]
		#_class_traitButton.get_node("AnimatedButton").label_name = GlobalManager._class_traits[classIndex].name
		#_class_traitButton.get_node("PanelContainer/MarginContainer/VBoxContainer/TextEdit").text = GlobalManager._class_traits[classIndex].description
		$ScrollContainer1/Scroll/VBoxContainer/ClassTraits/MarginContainer/VBoxContainer/Contents.add_child(_class_traitButton)
