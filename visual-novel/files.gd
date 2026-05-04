extends MenuBar
var config1 = ConfigFile.new()
var config2 = ConfigFile.new()
var config3 = ConfigFile.new()
var my_date_time: int
var new_date_time_str: String
var unix_time = Time.get_unix_time_from_system()
var new_date_time_str2: String
var my_date_time2 = Time.get_unix_time_from_system()
var new_date_time_str3: String
var my_date_time3 = Time.get_unix_time_from_system()
var offset_seconds = 2 * 3600
var adjusted_time = unix_time + offset_seconds

func _init() -> void:
	config1.load("user://gameSaveFile1.cfg")
	config2.load("user://gameSaveFile2.cfg")
	config3.load("user://gameSaveFile3.cfg")
	@warning_ignore("unused_local_constant")
	const SECS_PER_DAY: int = 24 * 60 * 60
	@warning_ignore("narrowing_conversion")
	my_date_time = Time.get_unix_time_from_system()
	new_date_time_str =config1.get_value("dateTime1","dateTime1","null1")
	my_date_time2 = Time.get_unix_time_from_system()
	new_date_time_str2 =config2.get_value("dateTime2","dateTime2","null2")
	my_date_time3 = Time.get_unix_time_from_system()
	new_date_time_str3 =config3.get_value("dateTime3","dateTime3","null3")

func _ready() -> void:
	loadTimeLabels()

func loadTimeLabels():
	if %saveTimeLabel1!=null:
		%saveTimeLabel1.text=new_date_time_str
	if %saveTimeLabel2!=null:
		%saveTimeLabel2.text=new_date_time_str2
	if %saveTimeLabel3!=null:
		%saveTimeLabel3.text=new_date_time_str3
	
func _on_close_saves_pressed() -> void:
	print("hideMeRun")
	get_tree().paused=false
	queue_free()

func save1()->void:
	%UiSimpleConfirm.play()
	print("save 1 skips:")
	print(GlobalVar.dialogSkips)
	config1.set_value("dateTime1","dateTime1",Time.get_datetime_string_from_unix_time(my_date_time))
	config1.set_value("Paht1","path1",GlobalVar.path1)
	config1.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config1.save("user://gameSaveFile1.cfg")

func save2()->void:
	%UiSimpleConfirm.play()
	print("saving 2")
	config2.set_value("dateTime2","dateTime2",Time.get_datetime_string_from_unix_time(my_date_time2))
	config2.set_value("Paht1","path1",GlobalVar.path1)
	config2.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config2.save("user://gameSaveFile2.cfg")
	
func save3()->void:
	%UiSimpleConfirm.play()
	print("saving 3")
	config3.set_value("dateTime3","dateTime3",Time.get_datetime_string_from_unix_time(my_date_time3))
	config3.set_value("Paht1","path1",GlobalVar.path1)
	config3.set_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	config3.save("user://gameSaveFile3.cfg")
	
func _on_save_1_pressed() -> void:
	save1()
	%Save1.text="SAVED"
	loadTimeLabels()

func _on_load_1_pressed() -> void:
	%UiSimpleConfirm.play()
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
	loadTimeLabels()

func _on_load_2_pressed() -> void:
	%UiSimpleConfirm.play()
	config2.load("user://gameSaveFile2.cfg")
	GlobalVar.path1=config2.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.dialogSkips=config2.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.loadNow2=true
	print(GlobalVar.loadNow2)
	_on_close_saves_pressed()

func _on_save_3_pressed() -> void:
	save3()
	%Save3.text="SAVED"
	loadTimeLabels()

func _on_load_3_pressed() -> void:
	%UiSimpleConfirm.play()
	config3.load("user://gameSaveFile3.cfg")
	GlobalVar.path1=config3.get_value("Path1","path1",GlobalVar.path1)
	GlobalVar.dialogSkips=config3.get_value("dialogSkips","DialogSkips",GlobalVar.dialogSkips)
	GlobalVar.loadNow2=true
	print(GlobalVar.loadNow2)
	_on_close_saves_pressed()
