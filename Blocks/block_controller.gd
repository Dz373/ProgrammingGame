extends Control

@onready var code_list = $ScrollContainer/VBoxContainer
@onready var player = $"../Player"
@export var timer_interval:float=1

var list:=[]
var cur_blk:Block:
	set(blk):
		if cur_blk != null:
			cur_blk.highlight.visible=false
		
		cur_blk=blk
		if blk!=null:
			cur_blk.highlight.visible=true
			
			if insert_list != blk.get_parent():
				insert_list=blk.get_parent()

@onready var list_highlight = $ListHighlight
var cur_highlight:
	set(value):
		if cur_highlight:
			cur_highlight.visible=false
		if value:
			cur_highlight=value
			cur_highlight.visible=true
var insert_list:
	set(value):
		if value==code_list:
			list_highlight.visible=true
			if cur_highlight:
				cur_highlight.visible=false
		else:
			list_highlight.visible=false
			cur_highlight.visible=true
		insert_list=value

func _ready() -> void:
	insert_list=code_list

func run_code() -> void:
	for blk in code_list.get_children():
		cur_blk=blk
		await blk.statement_call(player)
		await get_tree().create_timer(timer_interval).timeout
	
	if cur_highlight:
		cur_highlight.visible=false
	list_highlight.visible=false
	cur_blk=null
	$RunButton.disabled=true

func deselect()->void:
	cur_blk=null
	insert_list=code_list

func clear()->void:
	for child in code_list.get_children():
		child.queue_free()
	insert_list=code_list
	cur_highlight=list_highlight

func insert_block(new_blk: Block)->void:
	insert_list.add_child(new_blk)
	new_blk.block_controller=self
	
	if cur_blk != null:
		insert_list.move_child(new_blk, cur_blk.get_index()+1)
