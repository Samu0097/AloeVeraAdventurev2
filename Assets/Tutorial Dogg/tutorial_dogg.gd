extends Node

var animated_sprite : AnimatedSprite2D
var animated_cloud : AnimatedSprite2D
var check_intro = false
var elapsed_time = 0
var use_text = 0
@onready var active_label = RichTextLabel
var print_text = false

var exit_count = Global.exitCount
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = $Dogg
	animated_sprite.play("idle")
	animated_cloud = $Cloud
	active_label = $Cloud/RichTextLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	
	if check_intro==true and elapsed_time >= 2.99  and use_text==0 and print_text==true:
		print("cloud on")
		cloud()
		use_text +=1
		print(active_label.text)
		
	elif check_intro==true and elapsed_time >= 10.99  and use_text==1 and print_text==true:
		print("cloud on")
		$Cloud.visible = not $Cloud.visible
		cloud()
		active_label.text = "[center]" + "Ayy, it's time to roll the dice and start a new game, my friend. Let's see what kind of moves you're gonna make. Game on!"
		use_text +=1
		print(active_label.text)
		
	elif check_intro==false and elapsed_time >=0.5 and use_text==0 and print_text==true:
		print("cloud oon")
		cloud()
		print(active_label.text)
		print_text=false
		
	elif  check_intro==false and use_text==1 and print_text==true:
		cloud()
		active_label.text = "[center]" + "1"
		print_text=false
		
	elif  check_intro==false and use_text==2 and print_text==true:
		cloud()
		active_label.text = "[center]" + "2"
		print_text=false
		
	elif  check_intro==false and use_text==3 and print_text==true:
		cloud()
		active_label.text = "[center]" + "3"
		print_text=false
		
	elif  check_intro==false and use_text==4 and print_text==true:
		cloud()
		active_label.text = "[center]" + "4"
		print_text=false
		
	elif  check_intro==false and use_text==5 and print_text==true:
		cloud()
		active_label.text = "[center]" + "5"
		print_text=false
		
func cloud():
	animated_sprite.play("cloud")
	await(animated_sprite.animation_finished)
	$Cloud.visible = not $Cloud.visible
	animated_cloud.play("default")
	animated_sprite.play("idle")
	

func _on_intro_ready():
	check_intro = true
	print_text = true

func _on_exit_ready():
	check_intro = false
	use_text = exit_count  
	print(use_text, " :EC Dogg: ",exit_count)
	print_text = true
