extends State

func _ready() -> void:
	state_name = "bossman_unsit"

func enter():
	managed_entity.animation_player.play("dab")

func _on_animation_finish():
	change_to_state.emit("bossman_idle")
