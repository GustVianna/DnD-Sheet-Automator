extends Resource
class_name RaceData

@export var image : Texture2D
@export var unique_id := ""
@export var name := ""
@export var description := ""
@export var traits : Array[RacialTraitData]
@export_enum("Acquisitions Incorporated", "Astral Adventurer's Guide", "Dragonlance: Shadow of the Dragon Queen", "Dungeon Master's Guide", "Eberron: Rising from the Last War", "Elemental Evil Player's Companion", "Fizban's Treasury of Dragons", "Guildmasters' Guide to Ravnica", "Icewind Dale: Rime of the Frostmaiden", "Mordenkainen Presents: Monsters of the Multiverse", "Mordenkainen's Tome of Foes", "Mythic Odysseys of Theros", "Player's Handbook", "Strixhaven: A Curriculum of Chaos", "Sword Coast Adventurer's Guide", "Tasha's Cauldron of Everything", "The Wild Beyond the Witchlight", "Van Richten's Guide to Ravenloft", "Volo's Guide to Monsters") var source : String

func race_chosen():
	return
