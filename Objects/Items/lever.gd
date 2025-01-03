extends Item

@export var toggle:bool:
	set(val):
		if val:
			frame=1
		else:
			frame=0
		toggle=val
@export var id:int=0

func interact()->void:
	toggle = !toggle

func reset()->void:
	toggle = initial_state.toggle
