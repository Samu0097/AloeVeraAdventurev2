extends Area2D

func _on_body_entered(body):
	if body is Player and Global.life == 0:
		
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Scene/game_over_screen.tscn")
		#Death Menu anzeigen lassen
	else:
		if body.has_method("ResetPlayer"):
			body.ResetPlayer()
