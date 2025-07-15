extends State

@export var animation_player: AnimationPlayer

func _ready() -> void:
	state_name = 'bossman_sat'

func enter(old_state):
	animation_player.play("sat")

func process(_delta: float) -> void:
	if Input.is_action_pressed("player_interact"):
		change_to_state.emit("bossman_unsit")
