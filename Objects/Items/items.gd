class_name Item
extends Sprite2D

@onready var grid = load("res://Objects/Grid.tres")

@export var interactable:bool = false
@export var passable:bool = true

var initial_state

var cell:=Vector2.ZERO:
	set(value):
		cell = grid.grid_clamp(value)
		position = grid.get_map_position(cell)

func _ready() -> void:
	cell = grid.get_cell_position(position)

func _to_string() -> String:
	return name
