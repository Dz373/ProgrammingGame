class_name Pushable
extends Item

func push(direction:Vector2)->bool:
	#checks if next space is valid
	if is_valid_cell(cell+direction):
		cell+=direction
		return true
	else:
		return false

func is_valid_cell(new_cell:Vector2)->bool:
	if new_cell in get_parent().items:
		return false
	
	return true
