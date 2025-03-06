extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	match GlobalManager._class_order[0]:
		"Wizard":
			texture = load("res://Assets/WizardBackground.jpg")
		"Artificer":
			texture = load("res://Assets/ArtificerBackground.jpg")
		"Bard":
			texture = load("res://Assets/BardBackground.jpg")
		"Barbarian":
			texture = load("res://Assets/BarbarianBackground.jpg")
		"Sorcerer":
			texture = load("res://Assets/SorcererBackground.jpg")
		"Paladin":
			texture = load("res://Assets/PaladinBackground.jpg")
		"Rogue":
			texture = load("res://Assets/RogueBackground.jpg")
		"Druid":
			texture = load("res://Assets/DruidBackground.jpg")
		"Monk":
			texture = load("res://Assets/MonkBackground.jpg")
		"Fighter":
			texture = load("res://Assets/FighterBackground.jpg")
		"Ranger":
			texture = load("res://Assets/RangerBackground.jpg")
		"Warlock":
			texture = load("res://Assets/WarlockBackground.jpg")
		"Cleric":
			texture = load("res://Assets/ClericBackground.jpg")
