extends Node

var animated_sprite : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = $Dogg
	animated_sprite.play("cloud")
	$Cloud.visible = not $Cloud.visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func cloud():
	animated_sprite.play("cloud")
	$Cloud.visible = not $Cloud.visible
