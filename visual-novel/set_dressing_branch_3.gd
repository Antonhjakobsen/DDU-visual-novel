extends SetDressing
#loader karakterene som scener

func _ready() -> void:
	#instantiater karakterene
	var o:VNCharacter=CHARA1.instantiate()
	var r:VNCharacter=CHARA2.instantiate()
	var q:VNCharacter=CHARA3.instantiate()
	var h:VNCharacter=CHARA4.instantiate()
	var k:VNCharacter=CHARA5.instantiate()
	#tilføjer dem til scenen
	add_child(o)
	add_child(r)
	add_child(q)
	add_child(h)
	add_child(k)
	#kommandoer som kan udføres:
	#_.snap(%position)
	#_.move(%position,tid brugt på bevægelse)
	#_.say("navn", "Hvad der skal siges") (brug \n til at gå en linje ned og tilføj 2 mellemrum)
	#_.flip_(h/v)=(true/false)
	#_.attr("navn på alternativ udseende på karakter")
	#await venter på den sidste kommando er færdig til at udføre den næste
	o.snap(%OOSL)
	r.snap(%OOSL)
	q.snap(%OOSL)
	h.snap(%OOSL)
	k.snap(%OOSL)
	%background.texture=load("res://backgrounds/Classroom.png")
	var transition1=create_tween()
	transition1.tween_property(%background, "modulate:a", 0, 0)
	transition1.tween_property(%background, "modulate:a", 1, 2)
	await o.move(%OOSL,2.5)
	await o.say("YOU", "I look down the hall and see the clubroom. \n  It's closer than I remember it, I could have sworn \n  that I'd be closer to the gym than our club.")
	await o.say("YOU", "I guess I must've gotten stupider.")
	await o.say("YOU", "I walk towards the clubroom, \n  with every step it feels like the hallway \n  keeps getting smaller and smaller. Everything feels distorted, \n  uncanny even, and yet nothing has changed.")
	await o.say("YOU", "It's only a feeling, \n  something I can't quite grasp.")
	await o.say("YOU", "Something beyond what I can see with my eyes.")
	await o.say("YOU", "A concept I can't describe.")
	await o.say("YOU", "An unknown variable that needs removal.")
	await o.say("YOU", "Fear, Solitude, Contempt, Hatred...\n  what are you truly beneath.")
	await o.say("YOU", "Why hide your FEAR with a smile brighter than the summer sky?")
	await o.say("YOU", "Why seek absolution within your own SOLITUDE?")
	await o.say("YOU", "Why hold others in CONTEMPT when your flaws burn brighter?")
	await o.say("YOU", "Why carry such HATRED within your heart, \n  when all it does is bleed upon the innocent?")
	await o.say("YOU", "Why do you all continue to carry this mark of pain?")
	await o.say("YOU", "You concede to living a life of agony and despair, \n  clinging to a decaying world.")
	await o.say("YOU", "Why do something so stupid, when mine is much better.")
	await o.say("YOU", "You have seen them with your own eyes.")
	await o.say("YOU", "Their irrational pitiful selves.")
	await o.say("YOU", "I can make them better, I have made them better.")
	await o.say("YOU", "They were nothing. \n  I pulled them apart and put them back together until they were beautiful. \n  Now they are something.")
	await o.say("YOU", "I was made to fix the world, so that I will.")
	await o.say("YOU", "Starting from their pitiful existence.")
	await o.say("YOU", "And into eternity.")
	await o.say("YOU", "Now you stand before the door.")
	await o.say("YOU", "Are you ready to face me? Being that stumbled upon my domain.")
	await o.say("YOU", "I can't help but wonder...what feeling lies beneath?")
	await o.say("YOU", "Now step forth.")
	await o.say("YOU", "...")
	await o.say("YOU", "I gently open the door.")
	await o.say("YOU", "The clubroom is empty all the club members have left, \n  except for one.")
	await q.say("Quickshot", "\"Oh you're back, I thought you wouldn't be back so soon...\"")
	await q.say("Quickshot", "\"Did something happen?\"")
	await o.say("YOU", "\"Q, your still here.\"")
	await o.say("YOU", "\"I don't know where the others went, I must have lost them.\"")
	await q.say("Quickshot", "\"I see...\"")
	await q.say("Quickshot", "\"So it's repeated already.\"")
	await o.say("YOU", "\"Why are you here alone, wasn't KING supposed to be with you?\"")
	await q.say("Quickshot", "\"We don't have to pretend anymore.\"")
	await q.say("Quickshot", "\"It's over.\"")
	await q.say("Quickshot", "\"Ravager was right...\"")
	await q.say("Quickshot", "\"All I do is look the other way and pretend.\"")
	await q.say("Quickshot", "\"What a shame.\"")
	await q.say("Quickshot", "\"Now it's too late.\"")
	await q.say("Quickshot", "...")
	await q.say("Quickshot", "\"Deep down I'd like to think I never had a choice.\"")
	await q.say("Quickshot", "\"But I know now that it was all just a lie to feel better.\"")
	await q.say("Quickshot", "\"Feel better about tricking my friends, \n  if I even have a right to call them that anymore.\"")
	var f = ColorRect.new()#laver farve firkant
	f.color = Color.BLACK#laver firkant sort, fordi teksten er hvid????
	f.set_anchors_preset(Control.PRESET_FULL_RECT)#Sætter L B til skærmstørrelse
	add_child(f)#tilføj firkant
	var T=Label.new()
	add_child(T)
	T.set_anchors_preset(Control.PRESET_FULL_RECT)
	T.text="Thanks for playing (for now)"

func wait(seconds:float) -> Signal:#Laver en timer til at holde øje med tiden (bruges andre til dialog box)
	return get_tree().create_timer(seconds).timeout

func _on_settings_button_down() -> void:#Åbner settings når settings knap trykkes
	VarOverlay.showMeSettings()#Kalder det fra VarOverlay script, som er globalt
	%UiSimpleConfirm.play()

func _on_save_button_down() -> void:#Samme som ovenfor
	VarOverlay.showMeSaves()
	%UiSimpleConfirm.play()

func _input(event)->void:#Åbner eller lukker escape menu når escape bliver trykket
	if event.is_action_pressed("escPressed"):
		if GlobalVar.escOpen==false:#Åbner hvis den ikke er åben
			%UiSimpleSelect.play()
			print(GlobalVar.escOpen)
			print("opening escMenu")
			VarOverlay.showMeEsc()#Kører det igennem det globale script
			GlobalVar.escOpen=true
		elif GlobalVar.escOpen and GlobalVar.openRelease:#Hvis den er åben, så lukker den
			%UiSimpleCancel.play()
			VarOverlay.overlayEsc.queue_free()
			GlobalVar.escOpen=false


func _on_menu_pressed() -> void:
	%UiSimpleConfirm.play()
	VarOverlay.showMeEsc()
	GlobalVar.escOpen=true
