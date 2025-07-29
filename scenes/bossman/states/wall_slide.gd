extends State

@export var input_module: InputModule
const slide_speed = 10

func _ready():
	state_name = "wall_slide"

func enter(_old_state):
	print("Entering Wall Slide")
	
func exit(newState):
	print("Exiting Wall Slide")
	
func process(delta):
	var wall_normal = managed_entity.get_wall_normal() # get_wall_normal() is already normalized
	
	if wall_normal.is_equal_approx(input_module.get_movement_vector()):
		change_to_state.emit("wall_unstick")
		return
	
	if input_module.is_jumping():
		change_to_state.emit("wall_jump")
		return
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
		return
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * slide_speed
	
