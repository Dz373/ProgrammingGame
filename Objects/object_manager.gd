extends Node2D

@export var grid:Resource
var interactables:={}
var blockables:={}
var items:={}

@onready var player = $"../Player"
@onready var start_pad = $Pad

func _ready() -> void:
	#create dictionaries for all objects
	for child in get_children():
		if child is Item and child.interactable:
			interactables[child.cell] = child
		
		if child is Item and !child.passable:
			blockables[child.cell] = child
		
		items[child.cell]=child
		
	#set player position to start_pad
	player.cell = start_pad.cell

func move_item(item: Item, old_cell:Vector2, new_cell:Vector2)->void:
	if(old_cell == new_cell):
		return
	
	if old_cell in interactables:
		interactables.erase(old_cell)
		interactables[new_cell] = item
	
	if old_cell in blockables:
		blockables.erase(old_cell)
		blockables[new_cell] = item
	
	if old_cell in items:
		items.erase(old_cell)
		items[new_cell] = item
	
func reset()->void:
	player.cell = start_pad.cell
	$"../CodeList/RunButton".disabled = false
	for child in get_children():
		child.reset()
