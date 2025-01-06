extends HSlider

func _ready() -> void:
	_on_value_changed(value)

func _on_value_changed(val: float) -> void:
	$Label2.text = str(val) + "s"
