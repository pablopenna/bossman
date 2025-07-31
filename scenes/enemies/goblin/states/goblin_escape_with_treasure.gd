extends State

@export var sac_module: SacModule
@export var animation_player: AnimationPlayer
const move_speed:float = 25
const escape_direction: Vector2 = Vector2.LEFT

func _ready():
	state_name = "goblin_escape_with_treasure"

func enter(_old_state) -> void:
	if sac_module.amount_carrying > 0:
		animation_player.play("idle_money")
	else:
		animation_player.play("idle")

func physics_process(delta: float) -> void:
	_process_movement()

func _process_movement() -> void:
	if managed_entity.is_on_floor():
		managed_entity.velocity.y = 0
	else:
		managed_entity.velocity.y = ProjectSettings.get_setting("physics/2d/default_gravity")	
	managed_entity.velocity.x = move_speed * escape_direction.x
