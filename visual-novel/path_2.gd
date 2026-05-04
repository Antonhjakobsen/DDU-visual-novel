extends MenuBar

func _on_true_button_up() -> void:
	GlobalVar.path2=true
	#change main scene til ny kopi and main scene med andre handlinger
	get_tree().change_scene_to_file("res://set_dressing_branch_2.1.tscn")
	queue_free()

func _on_false_button_up() -> void:
	GlobalVar.path2=false
	#change main scene til ny kopi and main scene med andre handlinger
	get_tree().change_scene_to_file("res://set_dressing_branch_3.tscn")
	queue_free()
