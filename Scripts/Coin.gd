extends Area2D

func _on_body_entered(body):
	if (body is Player):
		Global.coins += 1
		body.get_node("Camera2D/Coins/CoinsScore").text = str(Global.coins)
		queue_free()
