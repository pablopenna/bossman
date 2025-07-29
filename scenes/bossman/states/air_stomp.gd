extends State

@export var input_module: InputModule
@export var down_speed = 600

func _ready():
	state_name = "air_stomp"

func enter(_old_state):
	print("Entering Air Stomp")
	
func exit(newState):
	print("Exiting Air Stomp")
	
func process(delta):
	if input_module.is_dashing():
		change_to_state.emit("dash")
		return
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
		return
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * down_speed
