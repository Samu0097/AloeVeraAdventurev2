class_name Player
extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var JumpAvailability : bool
@onready var animated_sprite = $AnimatedSprite2D
@onready var JumpTimer : Timer = $JumpTimer


func _physics_process(delta):
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
	

func _on_jump_timer_timeout():
	JumpAvailability = false
