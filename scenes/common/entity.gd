class_name Entity extends CharacterBody2D

@export
var attributes: Attributes
var facing_direction: FacingDirectionUtils.FacingDirection = FacingDirectionUtils.FacingDirection.RIGHT
@export 
var animation_player: AnimationPlayer

func _physics_process(delta: float) -> void:
	facing_direction = FacingDirectionUtils.getFacingDirectionFromVelocityWithDefault(velocity, facing_direction)
	move_and_slide()
