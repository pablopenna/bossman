extends State

@export var input_module: InputModule
@export var input_buffer: InputBuffer
@export var dash_state: State
const horizontal_speed = 300
const gravity_multiplier = 1
const gravity_increase_on_jump_input_release = 15
const minimum_time_before_gravity_increase_enabled_ms = 150
var entered_state_time_ms: int
var custom_gravity : float = GravityUtils.get_gravity() * gravity_multiplier
var is_there_momentum: bool
var has_gravity_increase_been_applied: bool
var previous_state_name: String

func _ready():
	state_name = "air"

func enter(old_state):
	print("Entering Air")
	previous_state_name = old_state.state_name
	is_there_momentum = true
	has_gravity_increase_been_applied = false
	entered_state_time_ms = Time.get_ticks_msec()
	
func exit(newState):
	managed_entity.velocity.x = 0
	print("Exiting Air")
	
func process(delta):
	if input_module.is_dashing() and dash_state._is_dash_ready():
		change_to_state.emit("dash")
		return
		
	if input_module.is_moving_down() and input_module.is_jumping():
		change_to_state.emit("air_stomp")
		return
	
	if input_module.is_jumping() and input_buffer.can_coyote_time() and previous_state_name == "move":
		change_to_state.emit("jump")
		return
		
	if input_module.is_attacking():
		change_to_state.emit("rush_attack")
		return
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
		return
	
	if managed_entity.is_on_wall() and _is_entity_going_down():
		change_to_state.emit("wall_slide")
		return
	
	var input_dir = input_module.get_movement_vector().x
	# Need to do this as to not overwrite the movement of other states like wall_jump if there is no input while on air
	if input_dir != 0 or not is_there_momentum: 
		is_there_momentum = false
		managed_entity.velocity.x =  input_dir * horizontal_speed
		
	var frame_gravity = custom_gravity
	if _should_apply_gravity_increase():
		frame_gravity = custom_gravity * gravity_increase_on_jump_input_release
		has_gravity_increase_been_applied = true
		if managed_entity.velocity.y < 0:
			managed_entity.velocity.y = 0
	
	managed_entity.velocity.y = Vector2.DOWN.y * GravityUtils.get_velocity_applying_acceleration(
		managed_entity.velocity.y,
		frame_gravity,
		delta
	)
	
func _should_apply_gravity_increase():
	var current_time_ms = Time.get_ticks_msec()
	if current_time_ms < entered_state_time_ms + minimum_time_before_gravity_increase_enabled_ms:
		return false
	if input_module.is_jumping():
		return false
	if has_gravity_increase_been_applied:
		return false
	return true
	
func _is_entity_going_down():
	return managed_entity.velocity.y > 0
