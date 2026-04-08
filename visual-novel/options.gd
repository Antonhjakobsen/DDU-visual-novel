extends MenuBar
var master_bus_index = AudioServer.get_bus_index("Master")
var music_bus_index = AudioServer.get_bus_index("Music")
var sfx_bus_index = AudioServer.get_bus_index("SFX")
var text_speed: float

func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_index,linear_to_db(value))

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_index,linear_to_db(value))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_index,linear_to_db(value))

func _on_text_speed_value_changed(value: float) -> void:
	text_speed=value

func _on_close_settings_pressed() -> void:
	self.hide()
