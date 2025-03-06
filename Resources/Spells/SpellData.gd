extends Resource
class_name SpellData

@export var unique_id := ""
@export var name := ""
@export var description := ""
@export_flags("Wizard", "Bard", "Paladin", "Rogue (Arcane Trickster)", "Druid", "Cleric", "Sorcerer", "Warlock", "Fighter (Eldritch Knight)", "Artificer", "Ranger") var spell_classes = 0
@export var tags : Array[String] = []
@export var ritual := false
@export var concentration := false
@export_enum("Cantrip", "Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9") var spell_level: int
@export_enum("Necromancy", "Abjuration", "Divination", "Evocation", "Transmutation", "Illusion", "Enchantment", "Conjuration") var spell_school: String
@export_enum("1 action", "1 reaction", "10 minutes", "1 minute", "1 bonus action") var spell_casting_time: String
@export_enum("Necromancy", "Abjuration", "Divination", "Evocation", "1 bonus action") var spell_range: String
@export_enum("Instantaneous", "1 round", "8 hours", "Special", "Concentration up to 1 hour") var spell_duration: String
@export_flags("V", "S", "M") var spell_components = 0
@export_flags("Acid", "Bludgeoning", "Cold", "Fire", "Force", "Lightning", "Necrotic", "Piercing", "Poison", "Psychic", "Radiant", "Slashing", "Thunder", "Variable", "Weapon") var spell_damage = 0

func trigger_spell_effect():
	return
