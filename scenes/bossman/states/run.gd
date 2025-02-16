extends State

func _ready() -> void:
	state_name = 'bossman_run'

func enter():
	managed_entity.animation_player.play("idle")

func physics_process(delta: float) -> void:
	var input = Input.get_axis("player_move_left", "player_move_right")
	managed_entity.velocity = Vector2(input, 0) * managed_entity.attributes.move_speed
	
	if input == 0:
		change_to_state.emit("bossman_idle")
	
