extends State

const move_speed:float = 25
const treasure_direction = Vector2.RIGHT
const threshold_distance_to_treasure := 50
@export var process_timer: Timer
@export var sac_module: SacModule
@export var animation_player: AnimationPlayer

var initial_position: Vector2
var lerp_factor: float

func _ready() -> void:
	state_name = "goblin_go_for_treasure"

func enter(_old_state):
	sac_module.sacked.connect(_on_sac)
	sac_module.enable()
	if sac_module.amount_carrying > 0:
		animation_player.play("idle_money")
	else:
		animation_player.play("idle")
	
	initial_position = managed_entity.global_position
	lerp_factor = 0
	process_timer.start()
	process_timer.timeout.connect(timer_process)

func exit(_new_state):
	sac_module.sacked.disconnect(_on_sac)
	sac_module.disable()
	
	process_timer.stop()
	process_timer.timeout.disconnect(timer_process)
	
func physics_process(delta: float) -> void:
	#_process_movement_lerp(delta)
	managed_entity.move_and_slide()

func timer_process() -> void:
	_process_movement()
	#_process_treasure()

func _process_movement() -> void:
	if managed_entity.is_on_floor():
		managed_entity.velocity.y = 0
	else:
		managed_entity.velocity.y = ProjectSettings.get_setting("physics/2d/default_gravity")	
	
	managed_entity.velocity.x = move_speed * treasure_direction.x

func _on_sac(_amount_sacked: int) -> void:
	change_to_state.emit("goblin_escape_with_treasure")

#func _process_movement_lerp(delta: float) -> void:
	#var goblin = (managed_entity as Goblin)
	#if managed_entity.is_on_floor():
		#managed_entity.velocity.y = 0
	#else:
		#managed_entity.velocity.y = ProjectSettings.get_setting("physics/2d/default_gravity")	
	#
	#lerp_factor += delta * move_speed / 250.0
	#lerp_factor = clampf(lerp_factor, 0.0, 1.0)
	#goblin.global_position.x = lerp(initial_position.x, goblin.treasure.global_position.x, lerp_factor)
#
#func _process_treasure() -> bool:
	#var goblin = (managed_entity as Goblin)
	#var distance_to_treasure = goblin.global_position.distance_to(goblin.treasure.global_position)
	#if distance_to_treasure <= threshold_distance_to_treasure:
		#change_to_state.emit("goblin_idle")
		#return true
	#return false
