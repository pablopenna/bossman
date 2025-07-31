class_name EnemySpawner extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_point: Node2D
@export var treasure: Treasure
var spawn_timer: Timer

const spawn_cooldown_in_seconds = 5
const spawn_cooldown_variation_in_seconds = 2

func _ready() -> void:
	spawn_timer = $Timer
	_setup_spawn_timer()
	_start_spawning()

func spawn_goblin():
	var goblin: Goblin = enemy_scene.instantiate()
	var spawn_at: Vector2 = spawn_point.global_position if spawn_point != null else self.global_position
	
	goblin.position = spawn_at
	goblin.treasure = treasure
	get_tree().root.add_child(goblin)

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

func _on_timer_timeout() -> void:
	spawn_timer.start(_generate_spawn_cooldown())
	spawn_goblin()
