class_name Pressure_Plate
extends Togglable

@onready var collision = $Area2D

func toggle_item(tog: bool)->void:
	toggle = tog

func _on_area_entered(_area: Area2D) -> void:
	interact()

func _on_area_exited(_area: Area2D) -> void:
	interact()
	
