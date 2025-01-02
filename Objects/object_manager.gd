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

func move_item(item: Item, cell:Vector2)->void:
	if cell in interactables:
		interactables.erase(cell)
		interactables[item.cell] = item
	
	if cell in blockables:
		blockables.erase(cell)
		blockables[item.cell] = item
	
	if cell in items:
		items.erase(cell)
		items[item.cell] = item

func reset()->void:
	player.cell = start_pad.cell
