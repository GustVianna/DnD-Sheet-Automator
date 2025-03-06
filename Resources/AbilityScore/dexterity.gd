extends AbilityScoreData
class_name Dexterity

var added_race_sum : int
var added_feats_sum : int
var added_other_sum : int

func get_ability_score_total():
	
	if added_race.is_empty() == false:
		added_race_sum = added_race.values().reduce(sum)
	else:
		added_race_sum = 0
	
	if added_feats.is_empty() == false:
		added_feats_sum = added_feats.values().reduce(sum)
	else:
		added_feats_sum = 0
		
	if added_other.is_empty() == false:
		added_other_sum = added_other.values().reduce(sum)
	else:
		added_other_sum = 0
	
	total = floor(((GlobalManager.ability_scores.get("Dexterity") + added_other_sum + added_feats_sum + added_race_sum) /2) - 5)
	return total

func sum(accum):
	return accum
