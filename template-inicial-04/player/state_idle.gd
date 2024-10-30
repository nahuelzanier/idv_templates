extends AbstractState

func enter():
	emit_signal("call_method", "play_animation", "idle")

func handle_input(event):
	if event.is_action_pressed("fire_cannon"):
		emit_signal("call_method", "activate_weapon")

func handle_move():
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		emit_signal("call_method", "set_move_direction", direction)
		emit_signal("state_machine_call", "change_state", "walk")
