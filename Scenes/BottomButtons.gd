extends HBoxContainer

func _ready():
		
	$Stats.size_flags_stretch_ratio = 1.75
	get_node("../SwippableElements").pageChanged.connect(_on_page_changed)

func _on_page_changed(pageNumber):
	match pageNumber:
		1:
			$Stats.size_flags_stretch_ratio = 1.75
			$Inventory.size_flags_stretch_ratio = 1
			$Combat.size_flags_stretch_ratio = 1
			$Spells.size_flags_stretch_ratio = 1
		2:
			$Stats.size_flags_stretch_ratio = 1
			$Inventory.size_flags_stretch_ratio = 1.75
			$Combat.size_flags_stretch_ratio = 1
			$Spells.size_flags_stretch_ratio = 1
		3:
			$Stats.size_flags_stretch_ratio = 1
			$Inventory.size_flags_stretch_ratio = 1
			$Combat.size_flags_stretch_ratio = 1.75
			$Spells.size_flags_stretch_ratio = 1
		4:
			$Stats.size_flags_stretch_ratio = 1
			$Inventory.size_flags_stretch_ratio = 1
			$Combat.size_flags_stretch_ratio = 1
			$Spells.size_flags_stretch_ratio = 1.75
