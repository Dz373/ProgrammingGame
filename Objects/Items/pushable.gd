class_name Pushable
extends Item

func push(direction:Vector2i)->bool:
	#checks if next space is valid
	if get_parent().is_occupied(cell+direction):
		return false
	elif !grid.is_within_bounds(cell+direction):
		return false
	else:
		cell+=direction
		return true
