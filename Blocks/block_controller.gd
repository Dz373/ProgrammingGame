extends Control

@onready var code_list = $ScrollContainer/VBoxContainer
@onready var player = $"../Player"
var list:=[]
var cur_blk:Block:
	set(blk):
		if cur_blk != null:
			cur_blk.highlight.visible=false
		
		cur_blk=blk
		if blk!=null:
			cur_blk.highlight.visible=true

@export var interval:float = 1.0
var timer:Timer

func _ready() -> void:
	timer=Timer.new()
	timer.one_shot=false
	timer.wait_time=interval
	timer.connect("timeout", timer_timeout)
	get_parent().call_deferred("add_child", timer)

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
