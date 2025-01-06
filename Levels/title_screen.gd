extends Control

@onready var obj_manager = $Objects
@onready var code_manager = $CodeList

func _ready() -> void:
	
	await code_manager.run_code()
	obj_manager.reset()
	
	_ready()
