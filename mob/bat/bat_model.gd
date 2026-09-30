extends Node3D



@onready var animation_tree: AnimationTree = %AnimationTree



func hurt():
#	animation_tree.set("parameters/OneShot/request", true)
#above code will create an error in my version of GODOT
	animation_tree.set(
		"parameters/OneShot/request",
		AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE,
	)
