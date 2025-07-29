extends State

@export var animation_player: AnimationPlayer
@export var shoot_module: ShootModule
@export var input_module: InputModule

func _ready() -> void:
	state_name = 'bossman_sat'

func enter(old_state):
	animation_player.play("sat")

func process(_delta: float) -> void:
	if input_module.is_interacting():
		change_to_state.emit("bossman_unsit")
		return
	
	if input_module.is_reloading(InputModifier.JUST_PRESSED):
		shoot_module.projectile_creation_point = managed_entity.global_position + Vector2(randi_range(-100, 100), randi_range(-100, 0))
		shoot_module.shoot(Vector2.ZERO, 0)
	
	
