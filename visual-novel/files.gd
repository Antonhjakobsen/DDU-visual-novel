extends MenuBar
var config1 = ConfigFile.new()
var config2 = ConfigFile.new()
var config3 = ConfigFile.new()
var my_date_time: int
var new_date_time_str: String

func _init() -> void:
	config1.load("user://gameSaveFile1.cfg")
	@warning_ignore("unused_local_constant")
	const SECS_PER_DAY: int = 24 * 60 * 60
	@warning_ignore("narrowing_conversion")
	my_date_time = Time.get_unix_time_from_system()
	new_date_time_str =config1.get_value("dateTime","dateTime","null")

func _process(_delta: float) -> void:
	if %saveTimeLabel:
		%saveTimeLabel.text=new_date_time_str

func _on_close_saves_pressed() -> void:
	print("hideMeRun")
	get_tree().paused=false
	queue_free()

func save1()->void:
	print("save 1 skips:")
	print(GlobalVar.dialogSkips)
	config1.set_value("dateTime","dateTime",Time.get_datetime_string_from_unix_time(my_date_time))
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
	%Save1.text="SAVED"

func _on_load_1_pressed() -> void:
	config1.load("user://gameSaveFile1.cfg")
	GlobalVar.path1=config1.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.dialogSkips=config1.get_value("dialogSkips","DialogSkips")
	GlobalVar.loadNow2=true
	print("skips load 1:")
	print(GlobalVar.dialogSkips)
	print("loawNow?")
	print(GlobalVar.loadNow2)
	_on_close_saves_pressed()

func _on_save_2_pressed() -> void:
	save2()
	%Save2.text="SAVED"

func _on_load_2_pressed() -> void:
	GlobalVar.dialogSkips=config2.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.path1=config2.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.loadNow2=true
	print(GlobalVar.loadNow2)
	_on_close_saves_pressed()
	

func _on_save_3_pressed() -> void:
	save3()
	%Save3.text="SAVED"

func _on_load_3_pressed() -> void:
	GlobalVar.dialogSkips=config3.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.path1=config3.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.loadNow2=true
	print(GlobalVar.loadNow2)
	_on_close_saves_pressed()
