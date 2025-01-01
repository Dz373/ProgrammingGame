extends Node2D

@onready var start_blk = $"../Start"
@onready var player = $"../../Player"

func run_code() -> void:
	var blk = start_blk.nxt_blk
	while blk != null:
		blk.statement_call(player)
		#print(blk)
		blk = blk.nxt_blk
