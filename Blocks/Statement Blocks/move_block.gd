extends Block

func statement_call(player: Object) -> void:
	match blk_name:
		"Left":
			player.position += 64*Vector2.LEFT
		"Right":
			player.position += 64*Vector2.RIGHT
		"Down":
			player.position += 64*Vector2.DOWN
		"Up":
			player.position += 64*Vector2.UP
