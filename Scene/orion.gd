extends Node2D 

func _ready():
	Global.set_level_index = 1
	
	
func _on_sea_void_body_entered(body):
	if body.has_method("LoseLife"):
		body.LoseLife()
	if body is Player and Global.life == 0:
		#Death Menu anzeigen lassen
		pass
	else:
		if body.has_method("ResetPlayer"):
			body.ResetPlayer()
