extends Node2D

@export var grid: Resource
var cell := Vector2i.ZERO:
	set(value):
		var new_cell: Vector2i = grid.grid_clamp(value)
		cell = new_cell
		position = grid.get_map_position(cell)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cell = grid.get_cell_position(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("confirm"):
		print(cell)
