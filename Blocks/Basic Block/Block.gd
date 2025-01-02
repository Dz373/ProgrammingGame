class_name Block
extends Control

@onready var code_list=$"../../../"
@onready var highlight = $ColorRect

func move_up()->void:
	if get_index()>0:
		get_parent().move_child(self, get_index()-1)

func move_down()->void:
	get_parent().move_child(self, get_index()+1)
	
func delete()->void:
	if code_list.cur_blk==self:
		code_list.cur_blk=null
	queue_free()
	
func select()->void:
	if code_list.cur_blk==self:
		code_list.cur_blk=null
	else:
		code_list.cur_blk=self

func _to_string() -> String:
	return $Label.text

#Override
@warning_ignore("unused_parameter")
func statement_call(player: Object) -> void:
	print(to_string() + "no statement call")
