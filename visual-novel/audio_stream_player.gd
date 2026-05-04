extends AudioStreamPlayer
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if self.playing==false:
		self.play()
	pass
