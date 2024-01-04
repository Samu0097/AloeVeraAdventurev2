extends Control
@onready var audio_player01 = $a01
@onready var audio_player02 = $a02
@onready var audio_player03 = $a03
@onready var audio_player04 = $a04
@onready var audio_player05 = $a05
@onready var audio_player06 = $a06
@onready var audio_player07 = $a07
@onready var audio_player08 = $a08
@onready var audio_player09 = $a09
@onready var audio_player10 = $a10
@onready var audio_playerC = $aC

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.exitCount = Global.exitCount + 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scene/Merkur.tscn")
	


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scene/exit.tscn")
	if Global.exitCount == 10:
		get_tree().quit()


func _on_credits_pressed():
	
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
	


func _on_tutorial_dogg_exit_01():
	audio_player01.play()


func _on_tutorial_dogg_exit_02():
	audio_player02.play()


func _on_tutorial_dogg_exit_03():
	audio_player03.play()


func _on_tutorial_dogg_exit_04():
	audio_player04.play()


func _on_tutorial_dogg_exit_05():
	audio_player05.play()


func _on_tutorial_dogg_exit_06():
	audio_player06.play()


func _on_tutorial_dogg_exit_07():
	audio_player07.play()


func _on_tutorial_dogg_exit_08():
	audio_player08.play()


func _on_tutorial_dogg_exit_09():
	audio_player09.play()


func _on_tutorial_dogg_exit_10():
	audio_player10.play()


func _on_tutorial_dogg_credits_00():
	print("gut")
	audio_playerC.play()
