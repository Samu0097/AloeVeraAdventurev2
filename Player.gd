class_name Player 
extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var JumpAvailability : bool
var animated_sprite : AnimatedSprite2D
@onready var JumpTimer : Timer = $JumpTimer

@onready var level_sprite_sets: Array = [] #Alle SpriteSets
#var current_level : int = 0  # Der aktuelle Level-Index
 

func _ready():
	Global.positionX = position.x
	Global.positionY = position.y
	animated_sprite = $AnimatedSprite2D
	load_sprite_sets()
	set_sprite_set(Global.set_level_index)
	print("Player: ", Global.set_level_index)

func _physics_process(delta):
	set_sprite_set(Global.set_level_index)
	# Add the gravity.
	if not is_on_floor() and JumpTimer.is_stopped():
		velocity.y += gravity * delta
		animated_sprite.play("fall")   #fall animation
		
	if is_on_floor():
		JumpAvailability = true
	elif JumpAvailability and JumpTimer.is_stopped():
		JumpTimer.start()

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and JumpAvailability:
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")   #jump animation
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if is_on_floor():
		animated_sprite.play("walk")   #walk animation
	if direction<0:
		animated_sprite.flip_h = true
	elif direction>0:
		animated_sprite.flip_h = false
	elif direction==0 and is_on_floor():
		animated_sprite.play("idle")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

	# Annahme: Ändere den Level-Index, wenn die Tab-Taste gedrückt wird
	#if Input.is_action_just_pressed("ui_focus_next"):
	#	set_sprite_set((current_level + 1) % level_sprite_sets.size())
	

func _on_jump_timer_timeout():
	JumpAvailability = false

func load_sprite_sets():
	# SpriteSets für unterschiedliche Level hinzu
	level_sprite_sets.append(load("res://Assets/AloeChar/autumn/autumn.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/normal/player.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/nude/nude.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/pink/pink.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/purple/purple.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/terminator-dead/dead.tres"))
	level_sprite_sets.append(load("res://Assets/AloeChar/xmas/xmas.tres"))
	
func set_sprite_set(set_level_index: int):
	if set_level_index < level_sprite_sets.size():
		animated_sprite.frames = level_sprite_sets[set_level_index]
		#current_level = level_index
		

func LoseLife():
	Global.life = Global.life -1
	
func ResetPlayer():
	position = Vector2(Global.positionX, Global.positionY)
	Global.life -= 1
