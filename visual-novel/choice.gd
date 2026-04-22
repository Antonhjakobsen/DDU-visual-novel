extends MenuBar

func _on_true_button_up() -> void:
	GlobalVar.path1=true
	queue_free()

func _on_false_button_up() -> void:
	GlobalVar.path1=false
	queue_free()
