extends State

const jump_speed = 1000

func _ready():
	state_name = "jump"
	
func enter(_old_state):
	print("Entering Jump")

func process(delta): # This has been move from enter to process just for StateLabel to detect the signals properly between jump and air
	managed_entity.velocity.y = Vector2.UP.y * jump_speed
	change_to_state.emit("air")

func exit(new_state):
	print("Exiting Jump")
