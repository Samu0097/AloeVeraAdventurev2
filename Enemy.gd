class_name Enemy
extends CharacterBody2D

var bat_speed = 75
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		position += (player.position - position) / bat_speed
		move_and_slide()


func _on_detection_area_body_entered(body):
		if body is Player:
			player = body
			player_chase = true


func _on_detection_area_body_exited(body):
	if body is Player:
		player = null
		player_chase = false


func _on_area_2d_body_entered(body):
	if is_instance_valid(body) and body.has_method("LoseLife"):
		body.LoseLife()
	
	if is_instance_valid(body) and body.has_method("ResetPlayer"):
		get_tree().current_scene = get_tree().current_scene
	else:
		if is_instance_valid(body) and body.has_method("ResetPlayer"):
			print(position)
			body.ResetPlayer()
			print(position)
