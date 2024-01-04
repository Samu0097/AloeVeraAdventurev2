extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	set_score()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_score():
	$GameOverPanel/Score.text = "Score (Coins): " + str(Global.coins) + "/300"
	

func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Intro.tscn")



func _on_quit_button_pressed():
	get_tree().quit()
