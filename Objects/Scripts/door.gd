extends Togglable

func toggle_item(tog: bool)->void:
	toggle = tog
	if toggle:
		frame=1
	else:
		frame=0
	passable = tog
