extends Node

@export var escOpen = false
@export var openRelease = false
var openedOnce=false

func _input(event)->void:
	if event.is_action_released("escPressed"):
		GlobalVar.openRelease=true
