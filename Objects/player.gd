extends Node2D

@export var grid: Resource

var cell:=Vector2.ZERO:
	set(value):
		cell = grid.grid_clamp(value)
		position = grid.calculate_map_position(cell)

func _ready() -> void:
	cell=Vector2(1,1)

func interact()->void:
	print(cell)
