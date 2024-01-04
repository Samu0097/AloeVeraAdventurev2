extends Area2D

	
func _on_body_entered(body):
	if body.has_method("Portal"):
		body.Portal()
	#get_tree().reload_current_scene()
