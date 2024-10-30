extends Node
class_name AbstractState

signal call_method
signal state_machine_call

func initialize(character_path, state_machine):
	call_method.connect(character_path.call)
	state_machine_call.connect(state_machine.call)

func enter() -> void: pass
func exit() -> void: pass

func handle_input(event) -> void: pass
func handle_move() -> void: pass
