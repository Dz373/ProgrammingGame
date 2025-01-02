extends Control

@onready var code_list = $ScrollContainer/VBoxContainer
@onready var player = $"../Player"
@onready var timer = $"../Timer"

var list:=[]
var cur_blk:Block:
	set(blk):
		if cur_blk != null:
			cur_blk.highlight.visible=false
		
		cur_blk=blk
		if blk!=null:
			cur_blk.highlight.visible=true

func run_code() -> void:
	list = code_list.get_children()
	if list.size()>0:
		cur_blk = list[0]
		timer.start()
	
func timer_timeout()->void:
	cur_blk.statement_call(player)
	if cur_blk.get_index()+1 == list.size():
		timer.stop()
		cur_blk=null
		return
	cur_blk = list[cur_blk.get_index()+1]

func deselect()->void:
	cur_blk=null

func reset()->void:
	for child in code_list.get_children():
		child.queue_free()
