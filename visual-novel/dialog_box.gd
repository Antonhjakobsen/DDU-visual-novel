class_name DialogBox extends Panel

var flick:bool=false

@export var dialog:String="lorem ipsum...":
	set(n):
		dialog=n
		reset_text()
var tween:Tween

@export var charName:  String

signal complete

func _on_button_pressed() -> void:
	flick=true
	print("click button ")

func _on_button_button_up() -> void:
	await get_tree().create_timer(1.0).timeout
	flick=false

func _input(event: InputEvent) -> void:
	await get_tree().create_timer(0.3).timeout
	if ! is_node_ready():
		return
	if event is InputEventMouseButton and event.is_pressed() and flick==true:
		print ("Click")
		advance()

func advance():
	if tween:
		print("Skipping ahead")
		tween.stop()
		tween=null
		%Dialogbox.visible_ratio=1
	else:
		print("Killing")
		self_destruct()

func advanceXTimes():
	print(GlobalVar.dialogSkips)
	print(GlobalVar.dialogSkipped)
	if tween and GlobalVar.dialogSkips!=GlobalVar.dialogSkipped:
		print("Stop tween")
		tween.stop()
		tween=null
		GlobalVar.dialogSkipped=GlobalVar.dialogSkipped+1
		self_destruct()
	elif GlobalVar.dialogSkips!=GlobalVar.dialogSkipped:
		print("Killing x Times")
		GlobalVar.dialogSkipped=GlobalVar.dialogSkipped+1
		print(tween)
		self_destruct()
	else:
		GlobalVar.loadNow=false
		reset_text()

func self_destruct():
	get_parent().remove_child(self)
	complete.emit()
	print("selfDestruct")
	queue_free()
	print("selfDestructed")

func _ready() -> void:
	#if GlobalVar.loadNow==true:
		#print("loadNow?:")
		#print(GlobalVar.loadNow)
		#reset_text()
		#advanceXTimes()
	#else:
	reset_text()

func reset_text():
	print("resetText")
	if ! is_node_ready():
		return
	%Dialogbox.text=" "+charName+" \n  " + dialog
	%Dialogbox.visible_ratio=0
	if tween:
		tween.stop()
	tween = get_tree().create_tween()
	@warning_ignore("integer_division")
	
	var dialogTextSpeed=(dialog.length()/30.0+0.5)*TextSpeed.text_speed
	if GlobalVar.loadNow==true and GlobalVar.dialogSkipped!=GlobalVar.dialogSkips:
		Engine.time_scale=100
	#print(TextSpeed.text_speed)
	#print("dialogtextspeed:")
	#print(dialogTextSpeed)
	tween.tween_property(%Dialogbox, "visible_ratio", 1, (dialogTextSpeed)).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	tween=null
	if GlobalVar.loadNow==true and GlobalVar.dialogSkipped!=GlobalVar.dialogSkips:
		Engine.time_scale=100
		GlobalVar.dialogSkipped=GlobalVar.dialogSkipped+1
		print(GlobalVar.dialogSkips)
		print(GlobalVar.dialogSkipped)
		self_destruct()
	else:
		GlobalVar.loadNow=false
		GlobalVar.dialogSkips=GlobalVar.dialogSkips+1
		Engine.time_scale=1

func _on_texture_button_pressed():
	print("Manual skip")
	advance()
