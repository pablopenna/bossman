class_name PlayerInputModule extends InputModule

func is_moving_left(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_move_left")
	
func is_moving_right(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_move_right")
	
func is_moving_up(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_move_up")
	
func is_moving_down(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_move_down")

func is_jumping(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_jump")

func is_dashing(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_dash")
	
func is_attacking(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_attack")

func is_interacting(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_interact")

func is_shooting(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_shoot")
	
func is_reloading(modifier: Variant = InputModifier.NONE) -> bool:
	var input_method: Callable = _get_input_method_from_modifier(modifier)
	return input_method.call("player_reload")

#region helper functions
func _get_input_method_from_modifier(modifier: InputModifier.Modifier = InputModifier.NONE) -> Callable:
	match modifier:
		InputModifier.JUST_PRESSED:
			return Input.is_action_just_pressed
		InputModifier.JUST_RELEASED:
			return Input.is_action_just_released
		_:
			return Input.is_action_pressed
#endregion
