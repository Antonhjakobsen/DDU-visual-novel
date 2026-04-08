class_name SetDressing extends Control

const CHARA1 = preload("res://character_example.tscn")
var overlay = preload("res://options.tscn").instantiate()
func _ready() -> void:
	var o:VNCharacter=CHARA1.instantiate()
	add_child(o)
	
	o.snap(%right)
	await o.move(%far_right,0.5)
	await wait(0.25)
	await o.move(%right,0.5)
	await wait(0.25)
	o.flip_h=true
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	await o.move(%leftish,1)
	await wait(0.5)
	await o.say("test","lorem ipsum 2")
	await o.move(%rightish,1)
	await o.move(%rightishUp,0.3)
	await o.move(%rightish,0.3)
	await wait(0.5)
	await o.move(%caCenter,1)

func wait(seconds:float) -> Signal:
	return get_tree().create_timer(seconds).timeout

func _on_settings_button_down() -> void:
	get_tree().current_scene.add_child(overlay)
	overlay.show()
	get_tree().paused=true
