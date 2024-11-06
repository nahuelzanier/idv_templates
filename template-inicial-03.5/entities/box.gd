extends RigidBody2D

func notify_hit(bullet):
	print("BARREL")
	bullet.call_deferred("explode")
