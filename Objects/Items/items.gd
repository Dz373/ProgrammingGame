class_name Item
extends Node2D

var grid = load("res://Objects/Grid.tres")
##player can interact with item
@export var interactable:bool = false
##player can share the same cell
@export var passable:bool = true
##non-player objects can share the same cell
@export var stackable:bool = false

var initial_state

var cell:=Vector2i.ZERO:
	set(value):
		#updates the objects in the dictionaries in object manager whenever cell is edited
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
