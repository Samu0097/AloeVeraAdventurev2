extends Control

var elapsed_time = 0
@onready var audio_player = $introAudio
@onready var audio_player2 = $introAudio2
var play_sound = true
var intro_audio2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.exitCount = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	if elapsed_time >=1.2 and play_sound == true:
		audio_player.play()
		play_sound = false
		
	if intro_audio2==true:
		audio_player2.play()


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scene/Merkur.tscn")
	


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scene/exit.tscn")
	print("EC Intro: ",Global.exitCount)
	if Global.exitCount == 10:
		get_tree().quit()


func _on_credits_pressed():
	
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
	


func _on_intro_audio_finished():
	play_sound = false


func _on_tutorial_dogg_intro_audio_2():
	play_sound = true
	intro_audio2 = true
