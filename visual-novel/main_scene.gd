class_name SetDressing extends Control

const CHARA1 = preload("res://character_example.tscn")

func _ready() -> void:
	var o:VNCharacter=CHARA1.instantiate()
	add_child(o)
	
	o.snap(%right)
	await o.move(%far_right,0.5)
	await wait(0.25)
	await o.move(%right,0.5)
	await wait(0.25)
	o.flip_h=true
	await o.say("hola")
	await o.move(%leftish,1)
	await wait(0.5)
	await o.say("halloo!")
	await o.move(%rightish,2)
	await wait(1)
	await o.move(%caCenter,2)

func wait(seconds:float) -> Signal:
	return get_tree().create_timer(seconds).timeout

func _on_settings_button_down() -> void:
	var overlay = load("res://options.tscn").instantiate()
	get_tree().current_scene.add_child(overlay)
