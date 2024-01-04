extends Area2D

var Trade = false
var bodyPlayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interaction") and Trade:
		if Global.coins > 49:
			Global.coins -= 50
			Global.life += 1
			bodyPlayer.StatusUpdate()

func _on_body_entered(body):
	if body is Player:
		bodyPlayer = body
		Trade = true
		get_node("Training").show()
		get_node("Intro").hide()

func _on_body_exited(body):
	if body is Player:
		bodyPlayer = null
		Trade = false
		get_node("Training").hide()
		get_node("Intro").show()
