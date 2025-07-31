class_name Treasure extends Area2D

@onready var _points: int = 100
const increase_on_tick = 10

func get_points():
	return _points

func sac(amount: int) -> int:
	return mini(amount, _points)

func _on_timer_timeout() -> void:
	_points += increase_on_tick
