extends MenuBar
@export var path1: bool
var config1 = ConfigFile.new()
var config2 = ConfigFile.new()
var config3 = ConfigFile.new()

func path1Do():
	pass

func _on_close_saves_pressed() -> void:
	print("hideMeRun")
	get_tree().paused=false
	queue_free()

func save1()->void:
	print("saving 1")
	config1.set_value("Paht1","path1",path1)
	config1.save("user://gameSaveFile1.cfg")
func save2()->void:
	print("saving 2")
	config2.set_value("Paht1","path1",path1)
	config2.save("user://gameSaveFile2.cfg")
	
func save3()->void:
	print("saving 3")
	config3.set_value("Paht1","path1",path1)
	config3.save("user://gameSaveFile3.cfg")
	
func _on_save_1_pressed() -> void:
	save1()

func _on_load_1_pressed() -> void:
	path1=config1.get_value("Path1","path1",path1)

func _on_save_2_pressed() -> void:
	save2()

func _on_load_2_pressed() -> void:
	path1=config2.get_value("Path1","path1",path1)

func _on_save_3_pressed() -> void:
	save3()

func _on_load_3_pressed() -> void:
	path1=config3.get_value("Path1","path1",path1)
