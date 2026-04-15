extends Control
var overlay = preload("res://options.tscn").instantiate()

func _on_options_pressed() -> void:
	get_tree().current_scene.add_child(overlay)
	overlay.show()
	get_tree().paused=true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scene.tscn")
