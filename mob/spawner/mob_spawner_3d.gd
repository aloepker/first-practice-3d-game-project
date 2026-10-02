extends Node3D

@export var mob_to_spawn: PackedScene = null

@onready var marker_3d: Marker3D = %Marker3D
@onready var timer: Timer = %Timer

# timer to spawn bats for the mob attacking the player
func _on_timer_timeout():
	preload("res://mob/mob.tscn")	
