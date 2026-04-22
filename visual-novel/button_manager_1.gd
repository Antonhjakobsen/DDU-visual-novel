extends Control
var overlay = preload("res://options.tscn").instantiate()

func _on_options_pressed() -> void:
	VarOverlay.showMeSettings()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _input(event)->void:
	if event.is_action_pressed("escPressed"):
		if GlobalVar.escOpen==false:
			print(GlobalVar.escOpen)
			print("opening escMenu")
			VarOverlay.showMeEsc()
			GlobalVar.escOpen=true
		elif GlobalVar.escOpen and GlobalVar.openRelease:
				VarOverlay.overlayEsc.queue_free()
				GlobalVar.escOpen=false
