extends Control

@onready var code_list = $"../../../../../CodeList"
@export var blk:PackedScene
var new_blk

func _on_button_down() -> void:
	new_blk = blk.instantiate()
	code_list.insert_block(new_blk)
