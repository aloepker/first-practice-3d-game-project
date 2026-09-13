extends CharacterBody3D
# hide the mouse cursor
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# detect mouse movements and move camera acordingly
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.2
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.2
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x, -80.0, 80.0 
		)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
#ground movement code :D
func _physics_process(delta):
	const SPEED = 5.5
	
	var input_direction_2D = Input.get_vector(
		"move_left", "move_right", "move_forward", "move_backwards"
	)	
	var input_direction_3D = Vector3(
		input_direction_2D.x, 0.0, input_direction_2D.y
	)
	#bellow code corrects the orientation of the key presses that move the character as we change direction with the mouse
	var direction = transform.basis * input_direction_3D
	
	#below will not work due to multiplying speed by zero
	#velocity = input_direction_3D * SPEED
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	move_and_slide()
