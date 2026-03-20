class_name SetDressing extends Control

const CHAR1 = preload("res://character_example.tscn")

func _ready() -> void:
	var o=CHAR1.instantiate()
	add_child(o)
	
	o.snap(%right)
	o.move(%far_right,2)
	await wait(1)
	o.move(%right,2)
	await wait(1)
	await o.say("abc")
	o.move(%leftish,2)
	await wait(1)
	o.move(%rightish,2)
	await wait(1)
	o.move(%caCenter,2)

func wait(seconds:float) -> Signal:
	return get_tree().create_timer(seconds).timeout
