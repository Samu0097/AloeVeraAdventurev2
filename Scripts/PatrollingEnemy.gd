extends CharacterBody2D 



var SPEED = -60.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false

func _physics_progrecess(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if !$RayCast2D.is_coliding () && is_on_floor():
		flip()
	
	
	velocity.x = SPEED
	move_and_slide()


func flip ():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right :
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1
