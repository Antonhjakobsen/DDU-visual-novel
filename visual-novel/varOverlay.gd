extends Node
var overlay
func showMe()->void:
	overlay = preload("res://options.tscn").instantiate()
	if (is_instance_valid(overlay)):
		print("valid")
		get_tree().root.add_child(overlay)
		overlay.show()
	else:
		print("error")
