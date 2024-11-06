@tool

extends Marker2D

@export var size_x : float
@export var size_y : float
@export var amount : int

func _draw() -> void:
	if Engine.is_editor_hint():
		draw_rect(Rect2(Vector2.ZERO, Vector2(size_x, size_y)), Color.BLUE, false)

func _process(delta) -> void:
	if Engine.is_editor_hint():
		queue_redraw()

func random_point() -> Vector2:
	var x = randf_range(global_position.x, global_position.x + size_x)
	var y = randf_range(global_position.y, global_position.y + size_y)
	return Vector2(x, y)
