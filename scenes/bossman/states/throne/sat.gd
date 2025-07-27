extends State

@export var animation_player: AnimationPlayer
@export var shoot_module: ShootModule

func _ready() -> void:
	state_name = 'bossman_sat'

func enter(old_state):
	animation_player.play("sat")

func process(_delta: float) -> void:
	if Input.is_action_pressed("player_interact"):
		change_to_state.emit("bossman_unsit")
		return
	
	if Input.is_action_pressed("player_reload"):
		shoot_module.projectile_creation_point = managed_entity.global_position + Vector2(randi_range(-100, 100), randi_range(-100, 0))
		shoot_module.shoot(Vector2.ZERO, 0)
	
	
