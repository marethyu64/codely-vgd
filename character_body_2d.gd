extends CharacterBody2D

const SPEED = 300.0 # Variable that tells how fast the player moves
const JUMP_VELOCITY = -400.0 # Variable that tells how fast the player jumps

var coins : int = 0

func _physics_process(delta: float) -> void: # Run every frame 
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right") # If pressing left, sets variable as -1. If pressing right, sets variable as 1. If not pressing anything, it will set variable as 0.
	if direction:
		velocity.x = direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
