extends Area2D

var Trade = false
var bodyPlayer = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interaction") and Trade:
		if Global.coins < 9:
			Global.coins -= 10
			Global.life += 1
			bodyPlayer.StatusUpdate()


func _on_body_entered(body):
	if body is Player:
		bodyPlayer = body
		Trade = true
		get_node("Trade").show()


func _on_body_exited(body):
	if body is Player:
		bodyPlayer = null
		Trade = false
		get_node("Trade").hide()
