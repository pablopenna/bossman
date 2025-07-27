extends Node

@export var enemy_spawner: EnemySpawner
@export var spawn_timer: Timer
const spawn_cooldown_in_seconds = 5
const spawn_cooldown_variation_in_seconds = 2

func _ready():
	_setup_spawn_timer()
	_start_spawning()

func _setup_spawn_timer():
	spawn_timer.autostart = false
	spawn_timer.one_shot = true
	spawn_timer.stop()
	
func _start_spawning():
	spawn_timer.start(_generate_spawn_cooldown())
	
func _generate_spawn_cooldown():
	return randf_range(
		spawn_cooldown_in_seconds - spawn_cooldown_variation_in_seconds, 
		spawn_cooldown_in_seconds + spawn_cooldown_variation_in_seconds
	)

func spawn_an_enemy():
	enemy_spawner.spawn_goblin()


func _on_timer_timeout() -> void:
	spawn_timer.start(_generate_spawn_cooldown())
	enemy_spawner.spawn_goblin()
