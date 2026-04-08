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

func self_destruct():
	get_parent().remove_child(self)
	complete.emit()
	queue_free()

func _ready() -> void:
	reset_text()

func reset_text():
	if ! is_node_ready():
		return
	%Dialogbox.text=" "+charName+" \n  " + dialog
	%Dialogbox.visible_ratio=0
	if tween:
		tween.stop()
	tween = get_tree().create_tween()
	@warning_ignore("integer_division")
	tween.tween_property(%Dialogbox, "visible_ratio", 1, ((dialog.length()/30)*TextSpeed.text_speed) +0.5).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	tween=null
	#self_destruct() ???? måske

func _on_texture_button_pressed():
	print("Manual skip")
	advance()
