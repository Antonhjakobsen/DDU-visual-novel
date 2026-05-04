extends MenuBar

func _on_true_button_up() -> void:
	GlobalVar.path1=true
	#change main scene til ny kopi and main scene med andre handlinger
	get_tree().change_scene_to_file("res://main_scene_branch1.tscn")
	queue_free()

func _on_false_button_up() -> void:
	GlobalVar.path1=false
	#change main scene til ny kopi and main scene med andre handlinger
	get_tree().change_scene_to_file("res://main_scene_branch2.tscn")
	queue_free()
