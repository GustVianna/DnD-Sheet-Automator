extends Resource
class_name FeatData

@export var unique_id := ""
@export var name := ""
@export var description := ""
@export var tags : Array[String] = []
@export_enum("Halfling", "-", "Dexterity 13 or higher", "Dragonborn", "Elf (drow)", "Dwarf", "Spellcasting or Pact Magic feature", "The ability to cast at least one spell", "Elf or half-elf", "4th Level", "Strike of the Giants (Fire Strike) feat", "Gnome", "Elf (high)", "Proficiency with a martial weapon", "Tiefling", "Strength 13 or higher", "Proficiency with medium armor", "Proficiency with heavy armor", "Charisma 13 or higher", "Proficiency with light armor", "Half-orc", "Half-elf or half-orc or human", "Intelligence or Wisdom 13 or higher", "Spellcasting feature or Rune Carver background", "Dexterity 13 or higher", "Dwarf or a Small race", "Proficiency with a martial weapon or Giant Foundling background", "Elf (wood)") var feat_prereq : String

func trigger_feat_effect():
	return
