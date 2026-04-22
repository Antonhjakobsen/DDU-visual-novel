extends MenuBar
#Deklererer variabler
var master_bus_index = AudioServer.get_bus_index("Master")
var music_bus_index = AudioServer.get_bus_index("Music")
var sfx_bus_index = AudioServer.get_bus_index("SFX")
var text_speed: float
var config = ConfigFile.new()
var MasterVolume
var MusicVolume
var SFXVolume
var textSpeed

func _ready() -> void:#Loader settings fra config fil når scenen åbner
	load_settings()

func load_settings()->void:#Loader alle settings når denne funktion er kørt
	config.load("user://optionsSaveFile.cfg")#Load filen
	MasterVolume = config.get_value("MasterVolume","master_volume",1)#Import
	MusicVolume = config.get_value("MusicVolume","music_volume",1)#Import
	SFXVolume = config.get_value("SFXVolume","sfx_volume",1)#Import
	textSpeed = config.get_value("TextSpeed","text_speed",0.5)#Import
	AudioServer.set_bus_volume_db(master_bus_index,db_to_linear(MasterVolume))#Setter værdien af audioserveren
	AudioServer.set_bus_volume_db(music_bus_index,db_to_linear(MusicVolume))#Setter værdien af audioserveren
	AudioServer.set_bus_volume_db(sfx_bus_index,db_to_linear(SFXVolume))#Setter værdien af audioserveren
	text_speed = textSpeed#Setter værdien af text speed
	set_slider_value()#Implementerer de satte værdier i sliders visuelt

func set_slider_value()->void:#Visuelt display af værdier der bliver set i starten
	if(%"Master volume"==null):#Nødvendig, vil altid give en error, før den virker for at initialisere
		print("(set_slider) null error")
	else:
		%"Master volume".value=config.get_value("MasterVolume","master_volume",1)#setter værdi i slideren direkte
		%"Music volume".value=config.get_value("MusicVolume","music_volume",1)#setter værdi i slideren direkte
		%"SFX volume".value=config.get_value("SFXVolume","sfx_volume",1)#setter værdi i slideren direkte
		%"Text speed".value=config.get_value("TextSpeed","text_speed",0.5)#setter værdi i slideren direkte

func _on_master_volume_value_changed(value: float) -> void:#Når værdi i slider bliver ændret kører denne funktion
	AudioServer.set_bus_volume_db(master_bus_index,db_to_linear(value))#Setter audioserver værdi til sliderens værdi

func _on_music_volume_value_changed(value: float) -> void:#Når værdi i slider bliver ændret kører denne funktion
	AudioServer.set_bus_volume_db(music_bus_index,db_to_linear(value))#Setter audioserver værdi til sliderens værdi

func _on_sfx_volume_value_changed(value: float) -> void:#Når værdi i slider bliver ændret kører denne funktion
	AudioServer.set_bus_volume_db(sfx_bus_index,db_to_linear(value))#Setter audioserver værdi til sliderens værdi

func _on_text_speed_value_changed(value: float) -> void:#Når værdi i slider bliver ændret kører denne funktion
	#Dette er til at teste: print(config.get_value("TextSpeed","text_speed"))
	text_speed=value#Setter værdien for lokale text speed
	#Dette er til at teste: print(text_speed)
	#Dette er til at teste: print(value)

func _on_close_settings_pressed() -> void:
	#Dette er til at teste: print("hideMeRun")
	save()#Kører en funktion som gemmer værdierne i config filer
	get_tree().paused=false#Sætter den originale scene igang igen
	queue_free()

func save()->void:#Gemmer værdier i config filer
	#Dette er til at teste: print("saving")
	config.set_value("MasterVolume","master_volume",$"%Master volume".value)
	config.set_value("MusicVolume","music_volume",$"%Music volume".value)
	config.set_value("SFXVolume","sfx_volume",$"%SFX volume".value)
	config.set_value("TextSpeed","text_speed",$"%Text speed".value)
	config.save("user://optionsSaveFile.cfg")
