extends Area2D

func _on_body_entered(body):
	if (body is Player):
		Global.life += 1
		body.get_node("Camera2D/Life/LifeScore").text = str(Global.life)
		queue_free()
