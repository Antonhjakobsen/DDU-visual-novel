extends MenuBar

func _on_resume_button_down() -> void:
	GlobalVar.escOpen=false
	get_tree().paused=false
	queue_free()

func _on_save_file_button_down() -> void:
	GlobalVar.escOpen=false
	get_tree().paused=false
	queue_free()

func _on_settings_button_down() -> void:
	VarOverlay.showMeSettings()

func _on_main_menu_button_down() -> void:
	GlobalVar.escOpen=false
	get_tree().paused=false
	get_tree().change_scene_to_file("res://main_menu.tscn")
	queue_free()

#@warning_ignore("unused_parameter")
#func _process(delta: float) -> void:
	#print("escOpen:")
	#print(GlobalVar.escOpen)
	#print("released:")
	#print(GlobalVar.openRelease)
