extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scene/Merkur.tscn")
	


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scene/exit.tscn")
	Global.exitCount = Global.exitCount + 1
	print(Global.exitCount)
	if Global.exitCount == 10:
		get_tree().quit()


func _on_credits_pressed():
	
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
	
