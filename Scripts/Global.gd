extends Node 


var coins = 0

var life = 3

var positionX
var positionY

var strength = 1
var agility = 1

const gravity = 8.1

var set_level_index : int = 0
func set_level_index_first(new_index):
	set_level_index = new_index
	print("Level index set to:", set_level_index)

var exitCount = 0

func close_game():
	get_tree().quit()
	
