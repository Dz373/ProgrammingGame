class_name Item
extends Sprite2D

var grid = load("res://Objects/Grid.tres")

@export var interactable:bool = false
@export var passable:bool = true

var initial_state

var cell:=Vector2.ZERO:
	set(value):
		if get_parent():
			get_parent().move_item(self, cell, value)
		cell = grid.grid_clamp(value)
		position = grid.get_map_position(cell)

func _ready() -> void:
	cell = grid.get_cell_position(position)
	initial_state = duplicate()
	initial_state.cell = cell

func _to_string() -> String:
	return name

func reset()->void:
	cell = initial_state.cell
