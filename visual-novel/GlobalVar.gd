extends Node

@export var escOpen = false#Holder styr på om escape menu er åbne
@export var openRelease = false#Sørger for at escape menuen ikke lukker direkte efter den åbner
@export var path1: bool#Dette er en path i historien
@export var dialogSkips: int
@export var dialogSkipped: int
@export var loadNow: bool

func _input(event)->void:#Holder øje med om spilleren releaser escape knappen og låser derefter op for muligheden for at lukke den igen
	if event.is_action_released("escPressed"):
		GlobalVar.openRelease=true
