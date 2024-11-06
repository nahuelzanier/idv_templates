extends Weapon

func adjust_position():
	look_at(get_global_mouse_position())
