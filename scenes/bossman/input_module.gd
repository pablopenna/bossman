class_name InputModule extends Node

#region
func is_moving_left(modifier: InputModifier.Modifier = InputModifier.NONE) -> bool:
	return false

func is_moving_right(modifier: Variant = null) -> bool:
	return false
	
func is_moving_up(modifier: Variant = null) -> bool:
	return false

func is_moving_down(modifier: Variant = null) -> bool:
	return false

func is_jumping(modifier: Variant = null) -> bool:
	return false

func is_dashing(modifier: Variant = null) -> bool:
	return false

func is_interacting(modifier: Variant = null) -> bool:
	return false

func is_attacking(modifier: Variant = null) -> bool:
	return false

func is_reloading(modifier: Variant = null) -> bool:
	return false

func is_shooting(modifier: Variant = null) -> bool:
	return false

#endregion

#region Auxiliary methods - not to be overriden
func get_movement_vector() -> Vector2:
	var axis = Vector2.ZERO
	if is_moving_left():
		axis += Vector2.LEFT
	if is_moving_right():
		axis += Vector2.RIGHT
	if is_moving_up():
		axis += Vector2.UP
	if is_moving_down():
		axis += Vector2.DOWN
	return axis

#endregion
