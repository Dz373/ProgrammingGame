extends Control

@onready var parent = $"../../../../../CodeList/ScrollContainer/VBoxContainer"
@onready var code_list = $"../../../../../CodeList"
@export var blk:PackedScene
var new_blk

func _on_button_down() -> void:
	new_blk = blk.instantiate()
	parent.add_child(new_blk)
	
	if code_list.cur_blk != null:
		parent.move_child(new_blk, code_list.cur_blk.get_index()+1)
