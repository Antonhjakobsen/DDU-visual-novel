extends MenuBar
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
	print(GlobalVar.dialogSkips)
	config1.set_value("Paht1","path1",GlobalVar.path1)
	config1.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config1.save("user://gameSaveFile1.cfg")

func save2()->void:
	print("saving 2")
	config2.set_value("Paht1","path1",GlobalVar.path1)
	config2.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config2.save("user://gameSaveFile2.cfg")
	
func save3()->void:
	print("saving 3")
	config3.set_value("Paht1","path1",GlobalVar.path1)
	config3.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config3.save("user://gameSaveFile3.cfg")
	
func _on_save_1_pressed() -> void:
	save1()

func _on_load_1_pressed() -> void:
	config1.load("user://gameSaveFile1.cfg")
	GlobalVar.path1=config1.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.dialogSkips=config1.get_value("dialogSkips","DialogSkips")
	GlobalVar.loadNow=true
	print(GlobalVar.dialogSkips)
	print(GlobalVar.loadNow)

func _on_save_2_pressed() -> void:
	save2()

func _on_load_2_pressed() -> void:
	GlobalVar.dialogSkips=config2.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.path1=config2.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.loadNow=true
	print(GlobalVar.loadNow)

func _on_save_3_pressed() -> void:
	save3()

func _on_load_3_pressed() -> void:
	GlobalVar.dialogSkips=config3.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.path1=config3.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.loadNow=true
	print(GlobalVar.loadNow)
