extends Node2D

@export var grid: Resource
@onready var obj_manager = $"../Objects"

var cell:=Vector2i.ZERO:
	set(value):
		cell = grid.grid_clamp(value)
		position = grid.get_map_position(cell)

func _ready() -> void:
	cell = grid.get_cell_position(position)

func interact()->void:
	if cell in obj_manager.items:
		if obj_manager.items[cell].interactable:
			obj_manager.items[cell].interact()

func move(direction: Vector2i)->void:
	#check if next cell has an item
	if obj_manager.is_occupied(cell+direction):
		#check if item is stackable
		if cell+direction in obj_manager.stackables:
			if !obj_manager.stackables[cell+direction].passable:
				return
		
		var item = obj_manager.items[cell+direction]
		#check if player can share cell with object
		if item.passable:
			cell+=direction
		
		#check if item can be pushed
		elif item is Pushable:
			if item.push(direction):
				cell+=direction
	else:
		cell+=direction
	
	if cell == obj_manager.goal.cell:
		obj_manager.end_game()
