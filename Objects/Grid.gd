class_name Grid
extends Resource

@export var size := Vector2(20,20)
@export var cell_size := Vector2(16,16)

var half_size = cell_size / 2

func get_map_position(grid_position: Vector2) -> Vector2:
	return grid_position * cell_size

func get_cell_position(map_position: Vector2) -> Vector2:
	return (map_position / cell_size).floor()

func is_within_bounds(cell_coordinates: Vector2) -> bool:
	if cell_coordinates.x < 0 or cell_coordinates.x > size.x:
		return false
	return cell_coordinates.y >= 0 and cell_coordinates.y < size.y

func grid_clamp(grid_position: Vector2) -> Vector2:
	var out := grid_position
	out.x = clamp(out.x, 0, size.x - 1.0)
	out.y = clamp(out.y, 0, size.y - 1.0)
	return out
