extends HSlider
var text_speed: float
var config = ConfigFile.new()

func _process(_delta: float) -> void:
	config.load("user://optionsSaveFile.cfg")
	if(config.get_value("TextSpeed","text_speed",0.5)!=null):
		text_speed = config.get_value("TextSpeed","text_speed",0.5)
	else:
		pass
