extends MenuBar
var master_bus_index = AudioServer.get_bus_index("Master")
var music_bus_index = AudioServer.get_bus_index("Music")
var sfx_bus_index = AudioServer.get_bus_index("SFX")
var text_speed: float
var config = ConfigFile.new()
var MasterVolume
var MusicVolume
var SFXVolume
var textSpeed

func _ready() -> void:
	load_settings()

func load_settings()->void:
	config.load("user://optionsSaveFile.cfg")
	MasterVolume = config.get_value("MasterVolume","master_volume",1)
	MusicVolume = config.get_value("MusicVolume","music_volume",1)
	SFXVolume = config.get_value("SFXVolume","sfx_volume",1)
	textSpeed = config.get_value("TextSpeed","text_speed",0.5)
	AudioServer.set_bus_volume_db(master_bus_index,db_to_linear(MasterVolume))
	AudioServer.set_bus_volume_db(music_bus_index,db_to_linear(MusicVolume))
	AudioServer.set_bus_volume_db(sfx_bus_index,db_to_linear(SFXVolume))
	text_speed = textSpeed
	set_slider_value()

func set_slider_value()->void:
	if(%"Master volume"==null):
		print("(set_slider) null error")
	else:
		%"Master volume".value=config.get_value("MasterVolume","master_volume",1)
		%"Music volume".value=config.get_value("MusicVolume","music_volume",1)
		%"SFX volume".value=config.get_value("SFXVolume","sfx_volume",1)
		%"Text speed".value=config.get_value("TextSpeed","text_speed",0.5)

func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_index,db_to_linear(value))

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_index,db_to_linear(value))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_index,db_to_linear(value))

func _on_text_speed_value_changed(value: float) -> void:
	print(config.get_value("TextSpeed","text_speed"))
	text_speed=value
	print(text_speed)
	print(value)

func _on_close_settings_pressed() -> void:
	print("hideMeRun")
	save()
	get_tree().paused=false
	queue_free()

func save()->void:
	print("saving")
	config.set_value("MasterVolume","master_volume",$"%Master volume".value)
	config.set_value("MusicVolume","music_volume",$"%Music volume".value)
	config.set_value("SFXVolume","sfx_volume",$"%SFX volume".value)
	config.set_value("TextSpeed","text_speed",$"%Text speed".value)
	config.save("user://optionsSaveFile.cfg")
