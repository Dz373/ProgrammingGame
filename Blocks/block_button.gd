extends Control

@onready var parent = $"../../../..".get_parent()
@export var blk:PackedScene
var new_blk

func _on_button_down() -> void:
	new_blk = blk.instantiate()
	
	var ofs = get_global_mouse_position() - global_position
	new_blk.position = get_global_mouse_position() - ofs
	
	parent.add_child(new_blk)
	new_blk._on_button_button_down()

func _on_button_up() -> void:
	new_blk._on_button_button_up()
