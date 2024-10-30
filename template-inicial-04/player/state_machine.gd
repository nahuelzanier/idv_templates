extends AbstractStateMachine

func _ready():
	state_dictionary["idle"] = $Idle
	state_dictionary["walk"] = $Walk
	state_dictionary["dead"] = $Dead
	for state in state_dictionary.values():
		state.initialize(get_node(character_path), self)

func _input(event):
	current_state.handle_input(event)
	current_state.handle_move()
