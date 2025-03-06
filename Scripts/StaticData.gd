extends Node

var spellData = {}
var rolesData = {}
var raceData = {}
var featData = {}
var invocationData = {}
var itemData = {}
var backgroundData = {}

var spell_data_path = "res://JSON/spells-phb.json"
var roles_data_path = "res://JSON/roles.json"
var race_data_path = "res://JSON/racesTest.json"
var feat_data_path = "res://JSON/feats.json"
var invocation_data_path = "res://JSON/invocations.json"
var item_data_path = "res://JSON/basicitems.json"
var background_data_path = "res://JSON/backgrounds.json"

func _ready():
	spellData = load_json_file(spell_data_path)
	rolesData = load_json_file(roles_data_path)
	raceData = load_json_file(race_data_path)
	featData = load_json_file(feat_data_path)
	invocationData = load_json_file(invocation_data_path)
	itemData = load_json_file(item_data_path)
	backgroundData = load_json_file(background_data_path)

func load_json_file(filePath: String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			printerr("Error reading file")
	
	else:
		printerr("File does not exist")
	
