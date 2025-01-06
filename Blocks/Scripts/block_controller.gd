extends Control

@onready var code_list = $ScrollContainer/VBoxContainer
@onready var player = $"../Player"
@onready var timer_slider = $HSlider
@onready var obj_manager = $"../Objects"

var list:=[]
var cur_blk:Block:
	set(blk):
		if cur_blk != null:
			cur_blk.highlight.visible=false
		
		cur_blk=blk
		if blk!=null:
			cur_blk.highlight.visible=true
			#changes scope to current block's
			if insert_list != blk.get_parent():
				insert_list=blk.get_parent()
		

@onready var list_highlight = $ListHighlight
var cur_highlight:
	set(value):
		if cur_highlight and is_instance_valid(cur_highlight):
			cur_highlight.visible=false
		if value:
			cur_highlight=value
			cur_highlight.visible=true
var insert_list:
	set(value):
		if value==code_list:
			list_highlight.visible=true
			if cur_highlight and is_instance_valid(cur_highlight):
				cur_highlight.visible=false
		else:
			list_highlight.visible=false
			if cur_highlight and is_instance_valid(cur_highlight):
				cur_highlight.visible=true
		insert_list=value

func _ready() -> void:
	insert_list=code_list

func run_code() -> void:
	$RunButton.disabled=true
	if $"../Button":
		$"../Button".disabled=true
	
	for blk in code_list.get_children():
		cur_blk=blk
		await blk.statement_call(player)
		await get_tree().create_timer(timer_slider.value).timeout
	
	if cur_highlight and is_instance_valid(cur_highlight):
		cur_highlight.visible=false
	list_highlight.visible=false
	cur_blk=null
	
	if $"../Button":
		$"../Button".disabled=false

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
