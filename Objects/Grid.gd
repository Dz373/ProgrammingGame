class_name Grid
extends Resource

@export var size := Vector2i(21,17)
@export var cell_size := Vector2i(32,32)

var half_size = cell_size / 2

func get_map_position(grid_position: Vector2i) -> Vector2i:
	return grid_position * cell_size

func get_cell_position(map_position: Vector2i) -> Vector2i:
	return map_position / cell_size

func is_within_bounds(cell_coordinates: Vector2i) -> bool:
	if cell_coordinates.x < 0 or cell_coordinates.x > size.x:
		return false
	return cell_coordinates.y >= 0 and cell_coordinates.y < size.y

func grid_clamp(grid_position: Vector2i) -> Vector2i:
	var out := grid_position
	out.x = clamp(out.x, 0, size.x - 1.0)
	out.y = clamp(out.y, 0, size.y - 1.0)
	return out
