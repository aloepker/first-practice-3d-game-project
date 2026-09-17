extends Area3D

# to move the bullet:
const SPEED = 5.0
const RANGE = 40.0

var travelled_distance = 0.0

#fires the bullet on its -z axis
func _physics_process(delta):
	position += -transform.basis.z * SPEED * delta
	# despawns the bullet after it travels past the RANGE value
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
