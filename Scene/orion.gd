extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var global_script = preload("res://Global.gd").new()
	global_script.set_level_index(5)
	var current_level = global_script.level_index
	print("Current Level: ", current_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
