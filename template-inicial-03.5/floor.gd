extends TileMapLayer

func notify_hit(bullet):
	print("...")
	bullet.call_deferred("explode")
