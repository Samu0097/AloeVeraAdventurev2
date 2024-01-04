extends Node

var animated_sprite : AnimatedSprite2D
var animated_cloud : AnimatedSprite2D
var check_intro = false
var elapsed_time = 0
var use_text = 0
@onready var active_label = RichTextLabel
var exit_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = $Dogg
	animated_sprite.play("idle")
	animated_cloud = $Cloud
	active_label = $Cloud/RichTextLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	
	if check_intro==true and elapsed_time >= 2.99  and use_text==0:
		print("cloud on")
		cloud()
		use_text +=1
		print(active_label.text)
	elif check_intro==false and elapsed_time >=0.5 and use_text==0:
		print("cloud oon")
		cloud()
		use_text +=1
		print(active_label.text)

func cloud():
	animated_sprite.play("cloud")
	await(animated_sprite.animation_finished)
	$Cloud.visible = not $Cloud.visible
	animated_cloud.play("default")
	animated_sprite.play("idle")
	

func _on_control_ready():
	check_intro = true


func _on_exit_ready():
	check_intro = false
	exit_count +=1
