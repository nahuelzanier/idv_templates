extends StaticBody2D

func notify_hit(bullet):
	print("...")
	bullet.call_deferred("explode")
