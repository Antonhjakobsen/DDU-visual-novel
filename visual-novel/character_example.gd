class_name VNCharacter extends TextureRect

@export var dialogue_box: PackedScene
@export var default_sprite:Texture2D
@export var tagged_sprite: Dictionary[String,Texture2D]

signal garbage_error

# Called when the node enters the scene tree for the first time.
func _ready():
	texture=default_sprite
	
func attr(attribute:String=""):
	print ("getting attribute" + attribute)
	texture=tagged_sprite.get(attribute,default_sprite)

func snap(targ:Node):
	position=targ.position + Vector2(-size.x/2,0)

func move(targ:Node, seconds:float=1, trans:Tween.TransitionType=Tween.TRANS_QUAD) -> Signal:
	var pos:Vector2=targ.position+Vector2(-size.x/2,0)
	var tween=get_tree().create_tween()
	tween.tween_property(self,"position",pos,seconds).set_trans(trans)
	return tween.finished

func say(text:String, tag:String="")->Signal:
	var d:DialogBox=dialogue_box.instantiate()
	if ! d:
		print("unknown dialog box config: " + str(dialogue_box))
		return garbage_error
	d.dialog=text
	get_tree().root.add_child(d)
	return d.complete
