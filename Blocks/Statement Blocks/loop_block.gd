class_name Nested_Block
extends Block

@onready var list = $List
@onready var list_highlight = $ColorRect
@onready var loop_num = $SpinBox

func _ready() -> void:
	highlight = $List/Panel/ColorRect

func statement_call(player: Object) -> void:
	var code_list = list.get_children()
	for i in range(loop_num.value):
		for blk in code_list:
			if blk is Block:
				block_controller.cur_blk=blk
				await blk.statement_call(player)
				await get_tree().create_timer(block_controller.timer_interval).timeout

func loop_select()->void:
	if block_controller.insert_list == list:
		block_controller.insert_list = block_controller.code_list
	else:
		block_controller.cur_highlight = list_highlight
		block_controller.insert_list = list
	block_controller.cur_blk = null

func _on_list_resized() -> void:
	if list:
		custom_minimum_size.y = list.size.y+30
		list.move_child($List/Panel, $List/Panel.get_index()+1)

func delete()->void:
	if block_controller.cur_blk==self:
		block_controller.cur_blk=null
	if block_controller.insert_list==list:
		block_controller.insert_list=block_controller.code_list
	queue_free()
