@warning_ignore("empty_file")
#extends Control

#func _on_options_pressed() -> void:
	#VarOverlay.showMe()

#func _on_quit_pressed() -> void:
	#get_tree().quit()

#func _on_start_pressed() -> void:
	#get_tree().change_scene_to_file("res://main_scene.tscn")
