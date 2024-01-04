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
			get_node("detectionArea").hide()



func _on_area_2d_body_entered(body):
	if body is Player and Global.life == 0:
		#Death Menu anzeigen lassen
		pass
	else:
		if body.has_method("ResetPlayer"):
			body.ResetPlayer()
