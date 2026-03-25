class_name DialogBox extends Panel

@export var dialog:String="lorem ipsum...":
	set(n):
		dialog=n
		reset_text()
var tween:Tween

signal complete
# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if ! is_node_ready():
		return
	if event is InputEventMouseButton and event.is_pressed():
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
	%Dialogbox.text=dialog
	%Dialogbox.visible_ratio=0
	if tween:
		tween.stop()
	tween = get_tree().create_tween()
	@warning_ignore("integer_division")
	tween.tween_property(%Dialogbox, "visible_ratio", 1, (dialog.length()/30) +0.5).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	tween=null
	#self_destruct() ???? måske

func _on_texture_button_pressed():
	print("Manual skip")
	advance()
