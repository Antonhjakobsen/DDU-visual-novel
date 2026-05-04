extends Control
var flip=true
func _on_options_pressed() -> void:
	%UiSimpleSelect.play()
	VarOverlay.showMeSettings()

func _on_quit_pressed() -> void:
	%UiSimpleCancel.play()
	get_tree().quit()

func _on_start_pressed() -> void:
	%UiSimpleConfirm.play()
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _input(event)->void:
	if flip:
		VarOverlay.showMeSettings()
		flip=false
		VarOverlay.overlay.hide()
	if event.is_action_pressed("escPressed"):
		if GlobalVar.escOpen==false:
			%UiSimpleSelect.play()
			print(GlobalVar.escOpen)
			print("opening escMenu")
			VarOverlay.showMeEsc()
			GlobalVar.escOpen=true
		elif GlobalVar.escOpen and GlobalVar.openRelease:
			%UiSimpleCancel.play()
			VarOverlay.overlayEsc.queue_free()
			GlobalVar.escOpen=false
