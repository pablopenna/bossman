extends State

func _ready() -> void:
	state_name = 'bossman_sat'

func enter():
	managed_entity.animation_player.play("sat")

func process(_delta: float) -> void:
	if Input.is_action_pressed("player_interact"):
		change_to_state.emit("bossman_unsit")
