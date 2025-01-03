class_name Pushable
extends Item

func push(direction:Vector2)->bool:
	#checks if next space is valid
	if cell+direction in get_parent().items or !grid.is_within_bounds(cell+direction):
		return false
	else:
		cell+=direction
		return true
