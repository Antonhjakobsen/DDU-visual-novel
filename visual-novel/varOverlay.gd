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

var overlayEsc

func showMeEsc()->void:
	overlayEsc = preload("res://escMenu.tscn").instantiate()
	if (is_instance_valid(overlayEsc)):
		print("valid")
		get_tree().root.add_child(overlayEsc)
		overlayEsc.show()
	else:
		print("error")

var overlayLogs

func showMeLogs()->void:
	overlayLogs=preload("res://files.tscn").instantiate()
	if (is_instance_valid(overlayLogs)):
		print("valid")
		get_tree().root.add_child(overlayLogs)
		overlayLogs.show()
	else:
		print("error")
	pass
