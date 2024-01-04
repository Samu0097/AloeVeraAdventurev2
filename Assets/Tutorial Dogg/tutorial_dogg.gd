extends Node

var animated_sprite : AnimatedSprite2D
var animated_cloud : AnimatedSprite2D
var check_intro = false
var elapsed_time = 0
var use_text = 0
@onready var active_label = RichTextLabel
var print_text = false
var check_credits = false

signal intro_audio2()

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
	
	if check_intro==true and elapsed_time >= 0.99  and use_text==0 and print_text==true:
		cloud()
		use_text +=1
		
	elif check_intro==true and elapsed_time >= 12.99  and use_text==1 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		cloud()
		active_label.text = "[center]" + "Ayy, it's time to roll the dice and start a new game, my friend. Let's see what kind of moves you're gonna make. Game on!"
		emit_signal("intro_audio2")
		use_text +=1
		print(active_label.text)
		
	elif check_intro==false and elapsed_time >=0.2 and use_text==0 and print_text==true:
		cloud()
		active_label.text = "[center]" + "Nah, nah, don't be hittin' that quit button just yet. Life's a game, and you gotta stay in it, my friend. We rollin' together, so let's keep it going."
		print_text=false
		
	elif  check_intro==false and use_text==1 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Ayy, nephew, don't be pressin' that exit, ya feel me? Life's a wild ride, and Tutorial Dogg ain't about takin' the easy way out. "
		print_text=false
		
	elif  check_intro==false and use_text==2 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Roll with the rhythm, start a fresh game. We keepin' it real, so stay and keep it Doggadelic, ya dig?"
		print_text=false
		
	elif  check_intro==false and use_text==3 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "HOLD UP! HOLD UP! You can't be walkin' out on this just yet. Tutorial Dogg's vibe is all about resilience and stayin' true to the hustle."
		print_text=false
		
	elif  check_intro==false and use_text==4 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Man, what you doin', tryna bounce outta here? Nah, we ain't havin' that. Press that NEW GAME button, PRONTO!"
		print_text=false
		
	elif  check_intro==false and use_text==5 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "You can't be walkin' away from the groove, the vibe, the whole Aloe experience. "
		print_text=false
		
	elif  check_intro==false and use_text==6 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Let's roll, start that new game, and let the doggfather guide you through this journey. No time for exits, only entrances."
		print_text=false
		
	elif  check_intro==false and use_text==7 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Ya gonna leave the party when it's just getting started? Nah, nephew, don't be hittin' that. How 'bout you slide over to the CREDITS section?"
		print_text=false
		
	elif  check_intro==false and use_text==8 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "There's a story behind every game, and the credits? They tell you who's been layin' down the beats and making it all happen."
		print_text=false
		
	elif  check_intro==false and use_text==9 and print_text==true:
		$Cloud.visible = not $Cloud.visible
		active_label.text = "[center]" + "Trust me, it's worth the peek. So, put that Quit idea on pause, hit up the CREDITS and let's give credit where credit's due."
		print_text=false
		
	elif  check_credits==true :
		active_label.text = "[center]" + "You got the vibe, my G! Hit that New Game and let the journey unfold like a smooth West Coast breeze."
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
	print_text = true


func _on_credits_ready():
	$Cloud.visible = not $Cloud.visible
	check_credits = true
