extends Node3D

func increase_score():
	pass

# function called when a new mob is spawned via signal
func _on_mob_spawner_3d_mob_spawned(mob):
	mob.died.connect() 
