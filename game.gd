extends Node3D

var player_score = 0

@onready var label: Label = %Label

func increase_score():
	player_score += 1
	label.text = "Score: " + str(player_score)
	
#puff cloud on enemy's death	
func puff_cloud(mob_global_position):
	const SMOKE_PUFF = preload("res://mob/smoke_puff/smoke_puff.tscn")
	var cloud = SMOKE_PUFF.instantiate()
	add_child(cloud)
	cloud.global_position = mob_global_position

# function called when a new mob is spawned via signal
func _on_mob_spawner_3d_mob_spawned(mob):
	mob.died.connect(func when_mob_dies():
		increase_score()
		puff_cloud(mob.global_position)
		) 
		#this may be causing the game to crash after getting a few kills now.. >.<
	puff_cloud(mob.global_position)


#code to "kill" the player when they fall off the edge
func _on_kill_plane_body_entered(_body: Node3D) -> void:
	#customize by adding a red death screen and a timer before the reload current scene call
	get_tree().reload_current_scene.call_deferred()
