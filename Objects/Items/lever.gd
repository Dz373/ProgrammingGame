extends Item

@export var toggle:bool:
	set(val):
		if val:
			$Sprite2D.frame=1
		else:
			$Sprite2D.frame=0
		toggle=val
@export var id:int=0

func interact()->void:
	toggle = !toggle

func reset()->void:
	toggle = initial_state.toggle
