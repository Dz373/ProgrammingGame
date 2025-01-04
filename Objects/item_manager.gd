extends Node2D

@export var grid:Resource
var items:={}
var stackables:={}

@onready var player = $"../Player"
@onready var start_pad = $Pad
@onready var goal = $Goal

func _ready() -> void:
	#create dictionaries for all objects
	for child in get_children():
		if child is TileMapLayer:
			child.initialize(stackables)
		
		elif child.stackable:
			stackables[child.cell] = child
		
		elif child is Item:
			items[child.cell] = child
	
	#set player position to start_pad
	player.cell = start_pad.cell

func move_item(item: Item, old_cell:Vector2i, new_cell:Vector2i)->void:
	if(old_cell == new_cell):
		return
	
	if old_cell in items:
		items.erase(old_cell)
		items[new_cell] = item

func is_occupied(cell:Vector2i)->bool:
	if cell in items:
		return true
	if cell in stackables and !stackables[cell].passable:
		return true
	return false

func reset()->void:
	player.cell = start_pad.cell
	$"../CodeList/RunButton".disabled = false
	for child in get_children():
		if child is Item:
			child.reset()

func end_game()->void:
	print("end game")
