class_name Togglable
extends Item

@export var toggle:bool=false
@export var id:int=0

func _ready() -> void:
	cell = grid.get_cell_position(position)
	initial_state = duplicate()
	initial_state.cell = cell
	toggle_item(toggle)

func interact()->void:
	toggle_linked()

func reset()->void:
	toggle_item(initial_state.toggle)

func toggle_item(tog: bool)->void:
	toggle = tog
	if toggle:
		frame=1
	else:
		frame=0

func toggle_linked()->void:
	for child in get_parent().toggles[id]:
		child.toggle_item(!child.toggle)
