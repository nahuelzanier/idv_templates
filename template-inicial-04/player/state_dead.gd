extends AbstractState

func enter():
	emit_signal("call_method", "play_animation", "dead")
