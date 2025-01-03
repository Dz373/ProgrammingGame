extends Node2D

@export var grid: Resource
@onready var obj_manager = $"../Objects"

var cell:=Vector2.ZERO:
	set(value):
		cell = grid.grid_clamp(value)
		position = grid.get_map_position(cell)

func _ready() -> void:
	cell = grid.get_cell_position(position)

func interact()->void:
	if cell in obj_manager.interactables:
		obj_manager.interactables[cell].interact()

func move(direction: Vector2)->void:
	#check if next cell is blocked
	if cell+direction in obj_manager.blockables:
		#check if object can be pushed
		var block = obj_manager.blockables[cell+direction]
		if block is Pushable:
			if block.push(direction):
				cell+=direction
	else:
		cell+=direction
