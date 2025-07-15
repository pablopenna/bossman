extends State

@export var animation_player: AnimationPlayer

func _ready() -> void:
	state_name = "bossman_unsit"

func enter(old_state):
	animation_player.play("dab")

func _on_animation_finish():
	change_to_state.emit("idle")
