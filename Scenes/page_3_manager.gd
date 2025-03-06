extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Passives
	for class_trait in GlobalManager._class_traits:
		if class_trait.trait_speed == "Passive":
			var button = load("res://Scenes/CombatActionButton.tscn").instantiate()
			button.get_node("Button/MarginContainer/HBoxContainer/ActionButton").text = class_trait.trait_name
			$ScrollContainer3/Scroll/VBoxContainer/Passives/ClassFeatures/MarginContainer/Items/ClassFeatures.add_child(button)
			class_trait.trigger_trait_effect()
	
	# Bonus Actions
		# Offhand attack
	if GlobalManager.weapon_equipped == true and GlobalManager.weapon_equipped_left == true:
		if StaticData.itemData["basicitem"][GlobalManager.equipped_weapon]["property"].has("L") and StaticData.itemData["basicitem"][GlobalManager.equipped_weapon_left]["property"].has("L"):
			$ScrollContainer3/Scroll/VBoxContainer/BonusActions/OtherBonusActions/MarginContainer/Items/OtherBonusActions/OffhandAttack.visible = true
			
		else:
			$ScrollContainer3/Scroll/VBoxContainer/BonusActions/OtherBonusActions/MarginContainer/Items/OtherBonusActions/OffhandAttack.visible = false
			
	else:
		return
		
	# Spellcasting


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
