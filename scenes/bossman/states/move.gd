extends State

const speed: float = 300
var target_velocity: Vector2

@export var input_buffer: InputBuffer
@export var input_module: InputModule

func _ready():
	state_name = "move"

func enter(_old_state):
	print("Entering Move")
	
func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	var input_movement_x = input_module.get_movement_vector().x
	managed_entity.velocity.x = input_movement_x * speed
	
	if input_module.is_jumping(InputModifier.JUST_PRESSED) or input_buffer.should_buffer_jump():
		change_to_state.emit("jump")
		return
		
	if input_module.is_dashing():
		change_to_state.emit("dash")
		return
	
	if input_module.is_attacking():
		change_to_state.emit("rush_attack")
		return

	if input_movement_x == 0:
		change_to_state.emit("idle")
		return
	
func exit(new_state):
	input_buffer.update_last_ground_time()
	print("Exiting Move")
