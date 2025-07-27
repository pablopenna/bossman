extends State

const move_speed := 25

func _ready() -> void:
	state_name = "goblin_go_for_treasure"
	
func physics_process(delta: float) -> void:
	managed_entity.velocity.x = move_speed
	managed_entity.velocity.y = ProjectSettings.get_setting("physics/2d/default_gravity")
	managed_entity.move_and_slide()
