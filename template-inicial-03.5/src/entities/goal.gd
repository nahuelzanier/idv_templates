extends Area2D

var active : bool = false

func _on_body_entered(body) -> void:
	if not active:
		active = true
		$AnimatedSprite2D.play("open")
		print("YOU WIN!")
