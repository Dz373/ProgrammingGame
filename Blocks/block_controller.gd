extends Control

@onready var code_list = $ScrollContainer/VBoxContainer
@onready var player = $"../Player"
var cur_blk:Block:
	set(blk):
		if cur_blk != null:
			cur_blk.highlight.visible=false
		cur_blk=blk
		if blk!=null:
			cur_blk.highlight.visible=true

func run_code() -> void:
	for blk in code_list.get_children():
		blk.statement_call(player)
