class_name Block
extends Control

@export var connected = false
@export var blk_name: String
var pre_blk: Block
var nxt_blk: Block
var blk_size: Vector2 = Vector2(0,64)

var shadow: Block = null
var insert_pos: Vector2

var dragging = false:
	set(value):
		set_process(value)
		dragging=value
var ofs = Vector2(0,0)
@onready var label = $MarginContainer/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - ofs
	
func _ready() -> void:
	label.text = blk_name
	set_process(false)

func _on_button_button_down() -> void:
	dragging = true
	ofs = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
	if connected:
		position = insert_pos
		if shadow:
			get_parent().call_deferred("remove_child", shadow)
			shadow=null

func _on_area_2d_area_entered(area: Area2D) -> void:
	var blk = area.get_parent()
	if dragging and not connected and blk.connected:
		connect_blk(blk)
		get_parent().call_deferred("add_child", shadow)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if dragging and connected and area.get_parent().connected:
		disconnect_blk()
		if shadow:
			get_parent().call_deferred("remove_child", shadow)
			shadow=null

func connect_blk(blk: Block):
	#block is inserted between two blocks
	if blk.nxt_blk:
		nxt_blk = blk.nxt_blk
		nxt_blk.pre_blk = self
	pre_blk = blk
	blk.nxt_blk = self
	
	insert_pos = pre_blk.position + blk_size/2 + pre_blk.blk_size/2
	shadow=duplicate()
	shadow.position = insert_pos
	shadow.modulate = 0xffffff32
	
	connected = true
	if nxt_blk:
		update_list_insert()

func disconnect_blk():
	#block is removed while between two blocks
	if nxt_blk!=null:
		nxt_blk.pre_blk = pre_blk
		pre_blk.nxt_blk = nxt_blk
		update_list_remove()
		nxt_blk = null
	#last block is removed
	else:
		pre_blk.nxt_blk = null	
	pre_blk = null
	
	connected = false

func update_list_insert():
	var blk = nxt_blk
	while blk!=null:
		blk.position += blk_size
		blk = blk.nxt_blk
		
func update_list_remove():
	var blk = nxt_blk
	while blk!=null:
		blk.position -= blk_size
		blk = blk.nxt_blk

func _to_string() -> String:
	return blk_name

#Override
@warning_ignore("unused_parameter")
func statement_call(player: Object) -> void:
	print(blk_name + " no statement call")
