extends State

@export var input_buffer: InputBuffer
@export var input_module: InputModule

func _ready():
	state_name = "idle"

func enter(_old_state):
	print("Entering Idle")

func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
		return
	
	if input_module.is_attacking():
		if input_module.is_moving_down():
			change_to_state.emit("blink_attack")
			return
		else:
			change_to_state.emit("idle_attack")
			return
	
	if input_module.get_movement_vector().x != 0:
		change_to_state.emit("move")
		return
		
	if input_module.is_dashing():
		change_to_state.emit("dash")
		return
	
	if input_module.is_jumping() or input_buffer.should_buffer_jump():
		change_to_state.emit("jump")
		return
	
func exit(new_state):
	print("Exiting Idle")
