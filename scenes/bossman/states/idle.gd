extends State

func _ready() -> void:
	state_name = 'bossman_idle'

func enter():
	managed_entity.animation_player.play("idle")

func process(delta: float) -> void:
	var input = Input.get_axis("player_move_left", "player_move_right")
	if input != 0:
		change_to_state.emit("bossman_run")
