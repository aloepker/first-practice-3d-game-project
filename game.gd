extends Node3D

var player_score = 0

@onready var label: Label = %Label

func increase_score():
	player_score += 1
	label.text = "Score: " + str(player_score)

# function called when a new mob is spawned via signal
func _on_mob_spawner_3d_mob_spawned(mob):
	mob.died.connect(increase_score) 
