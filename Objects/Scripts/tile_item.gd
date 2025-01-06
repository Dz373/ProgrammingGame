class_name Tile_Item
extends TileMapLayer

var grid = load("res://Objects/Grid.gd")

func initialize(stackables:Dictionary)->void:
	var item = Item.new()
	item.interactable=false
	item.passable=false
	item.stackable=true
	
	for cell in get_used_cells():
		get_parent().stackables[cell]=item
