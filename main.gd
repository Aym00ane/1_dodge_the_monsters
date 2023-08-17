extends Node

@export var mob_scene : PackedScene


func _ready():
	randomize()
func _on_mob_timer_timeout():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	var mob = mob_scene.instantiate()
	add_child(mob)
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI/2
	
	direction += randf_range(-PI/4,PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(mob.min_speed,mob.max_speed),0)
	mob.linear_velocity = velocity.rotated(direction)
