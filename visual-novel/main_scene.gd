class_name SetDressing extends Control

#loader karakterene som scener
const CHARA1 = preload("res://character_example.tscn")
const CHARA2 = preload("res://character_example2.tscn")
const CHARA3 = preload("res://character_example_3.tscn")

func _ready() -> void:
	#instantiater karakterene
	var o:VNCharacter=CHARA1.instantiate()
	var b:VNCharacter=CHARA2.instantiate()
	var u:VNCharacter=CHARA3.instantiate()
	#tilføjer dem til scenen
	add_child(o)
	add_child(b)
	add_child(u)
	
	#kommandoer som kan udføres:
	#_.snap(%position)
	#_.move(%position,tid brugt på bevægelse)
	#_.say("navn", "Hvad der skal siges") (brug \n til at gå en linje ned)
	#_.flip_(h/v)=(true/false)
	#_.attr("navn på alternativ udseende på karakter")
	#await venter på den sidste kommando er færdig til at udføre den næste
	
	b.snap(%left)
	o.snap(%right)
	await o.move(%far_rightUp,0.5)
	await wait(0.25)
	o.move(%leftish,0.5)
	await b.move(%right,0.5)
	await wait(0.25)
	o.flip_h=true
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	await o.say("test","Last year I would still have been in middle school.\n  It’s been a while since then, we didn’t know each \n  other exactly.")
	o.attr("switch")
	await o.move(%right,1)
	await wait(0.5)
	await o.say("test","lorem ipsum 2")
	await o.move(%rightish,1)
	await o.move(%rightishUp,0.3)
	await o.move(%rightish,0.3)
	await wait(0.5)
	await o.move(%caCenter,1)

func wait(seconds:float) -> Signal:#Laver en timer til at holde øje med tiden (bruges andre til dialog box)
	return get_tree().create_timer(seconds).timeout

func _on_settings_button_down() -> void:#Åbner settings når settings knap trykkes
	VarOverlay.showMeSettings()#Kalder det fra VarOverlay script, som er globalt

func _on_save_button_down() -> void:#Samme som ovenfor
	VarOverlay.showMeSaves()

func _on_skip_button_down() -> void:#Ikke færdigt
	pass # Replace with function body.

func _input(event)->void:#Åbner eller lukker escape menu når escape bliver trykket
	if event.is_action_pressed("escPressed"):
		if GlobalVar.escOpen==false:#Åbner hvis den ikke er åben
			print(GlobalVar.escOpen)
			print("opening escMenu")
			VarOverlay.showMeEsc()#Kører det igennem det globale script
			GlobalVar.escOpen=true
		elif GlobalVar.escOpen and GlobalVar.openRelease:#Hvis den er åben, så lukker den
				VarOverlay.overlayEsc.queue_free()
				GlobalVar.escOpen=false
