extends Node2D

var activated = true 

func _on_body_entered(body):
	#print("test")
	if activated:
		if body is Player:
			Global.positionX = body.position.x
			Global.positionY = body.position.y
			activated = false
