extends MenuBar

func _input(event):
	if event.is_action_pressed("escPressed"):
		VarOverlay.showMeEsc()

func _on_resume_button_down() -> void:
	get_tree().paused=false
	queue_free()
	pass # Replace with function body.

func _on_save_file_button_down() -> void:
	get_tree().paused=false
	queue_free()
	pass # Replace with function body.

func _on_settings_button_down() -> void:
	VarOverlay.showMe()
	pass # Replace with function body.

func _on_main_menu_button_down() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://main_menu.tscn")
	queue_free()
	pass # Replace with function body.
