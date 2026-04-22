extends Node
var overlay
func showMeSettings()->void:
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

var overlaySaves

func showMeSaves()->void:
	overlaySaves=preload("res://files.tscn").instantiate()
	if (is_instance_valid(overlaySaves)):
		print("valid")
		get_tree().root.add_child(overlaySaves)
		overlaySaves.show()
	else:
		print("error")
