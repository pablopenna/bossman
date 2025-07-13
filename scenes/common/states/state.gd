class_name State extends Node

signal change_to_state(new_state_name: String)
var managed_entity: Entity
# Use this property rather than the node name to define the state name
# StateManager uses this as the dict key where states are stored
var state_name: String 

func enter():
	pass
	
func process(_delta: float):
	pass
	
func physics_process(_delta: float):
	pass
	
func exit(_new_state: State):
	pass
