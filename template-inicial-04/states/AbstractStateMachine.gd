extends Node
class_name AbstractStateMachine

@export var character_path : NodePath
@export var start_state : AbstractState

var state_dictionary : Dictionary = {}

@onready var current_state = start_state

func change_state(state_name : String) -> void:
	current_state.exit()
	current_state = state_dictionary[state_name]
	current_state.enter()
