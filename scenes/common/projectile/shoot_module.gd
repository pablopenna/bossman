class_name ShootModule extends Node

@export var projectile_creation_node: Node2D
var projectile_creation_point: Vector2

@export var projectile_template: PackedScene
@export_flags_2d_physics var collision_mask: int

func shoot(direction: Vector2, speed: int):
	var projectile = projectile_template.instantiate() as Projectile
	projectile.global_position = projectile_creation_point if projectile_creation_point != null else projectile_creation_node.global_position
	projectile.speed = speed
	projectile.direction = direction
	projectile.collision_mask = collision_mask
	
	get_tree().root.add_child(projectile)
