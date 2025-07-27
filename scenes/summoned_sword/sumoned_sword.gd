extends Projectile

const _speed = 300
var launched := false

func _ready() -> void:
	super._ready()
	self.speed = 0
	self.direction = Vector2.RIGHT

func launch():
	self.speed = _speed
	launched = true
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_shoot"):
		launch()

func _physics_process(delta: float) -> void:
	if not launched:
		var target_position = get_global_mouse_position()
		self.look_at(target_position)
		self.direction = self.global_position.direction_to(target_position)
	else:
		super._physics_process(delta)
	
