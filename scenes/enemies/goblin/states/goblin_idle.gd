extends State

func _ready() -> void:
	state_name = "goblin_idle"

func enter(_old_state):
	managed_entity.velocity.x = 0
