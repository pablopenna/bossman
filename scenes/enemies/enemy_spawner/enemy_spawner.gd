class_name EnemySpawner extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_point: Node2D

func spawn_goblin():
	var goblin: Goblin = enemy_scene.instantiate()
	var spawn_at: Vector2 = spawn_point.global_position if spawn_point != null else self.global_position
	
	goblin.position = spawn_at
	get_tree().root.add_child(goblin)
