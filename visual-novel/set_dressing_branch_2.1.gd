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
	%background.texture=load("res://backgrounds/Classroom.png")
	r.snap(%OOSL)
	o.snap(%OOSL)
	q.snap(%OOSL)
	k.snap(%OOSL)
	h.snap(%OOSL)
	var transition1=create_tween()
	transition1.tween_property(%background, "modulate:a", 0, 0)
	transition1.tween_property(%background, "modulate:a", 1, 2)
	await wait(2)
	r.snap(%OOSL)
	o.snap(%"09")
	q.snap(%"14")
	k.snap(%"10")
	h.snap(%"15")
	await o.move(%"11",1.5)
	await o.say("Sentry", "\"Yo is that ...!\"")
	await o.say("Sentry", "\"That game is so good!\"")
	await o.say("Sentry", "\"We got to play that one!\"")
	await k.say("KING", "\"Alright let me collect the games, \n  I'll store them in the supply closet for the time being.\"")
	k.move(%"17",0.5)
	k.move(%"13",1.25)
	k.move(%"14",0.5)
	k.move(%"11",0.75)
	await o.say("YOU", "KING goes around collecting every game we brought, \n  and goes to the closet to store them. \n  While he does that Q goes over everything \n  we need to get done before the day ends.")
	await q.say("Quickshot", "\"Alright, then Harbinger and I will handle \n  all the flyers and decorations, just like last year.\"")
	await k.say("KING", "\"Actually, I could really use \n  your help this time around Q.\"")
	await k.say("KING", "\"I'm still pretty unsure about all \n  this club signage student counsel mumbo jumbo.\"")
	await q.say("Quickshot", "\"Oh uh, sure I can help out with that.\"")
	await q.say("Quickshot", "\"Then-\"")
	await h.say("Harbinger", "\"But you promised.\"")
	await q.say("Quickshot", "\"I'll have to help out KING with this.\"")
	await q.say("Quickshot", "\"We'll need to get this done today.\"")
	await q.say("Quickshot", "\"You've done this before, and you \n  know where the things will need to go.\"")
	await q.say("Quickshot", "\"It'll be fine.\"")
	await h.say("Harbinger", "Tch")
	await h.say("Harbinger", "\"I know...\"")
	await q.say("Quickshot", "\"We will need to set up the extra computers, we have been given. \n  Those should be down in the gym storage room.\"")
	await q.say("Quickshot", "\"Sentry, could you go get those.\"")
	await o.say("Sentry", "\"Aye, Aye captain!\"")
	await o.say("Sentry", "\"I'll bring the newbie with me. \n  I could use the extra help.\"")
	await q.say("Quickshot", "\"Alright, if you meet Ravager on the way, \n  tell him to come back here.\"")
	await o.say("Sentry", "\"Come on! Let's get working!\"")
	await o.say("YOU", "Sen grabs my arm, practically dragging me \n  out of the room and into the hallway.")
	await o.say("Sentry", "\"Those computers aren't going to fetch themselves!\"")
	await o.say("YOU", "Once again Sentry begins to pull my arm, \n  dragging me through the halls.")
	await o.say("YOU", "\"Woah slow down!\"")
	await o.say("YOU", "Finally arriving at the gym, I take a moment \n  to catch my breath after being dragged across the school.")
	await o.say("YOU", "Sentry wastes no time, he walks over to the computer storage \n  and begins to look for the ones we need.")
	await o.say("Sentry", "\"So how many are you?\"")
	await o.say("YOU", "\"How many what?\"")
	await o.say("Sentry", "\"First years of course! Is there a lot of you now?\"")
	await o.say("Sentry", "\"We might need more computers if there's a lot of you.\"")
	await o.say("YOU", "\"We aren't that many but might be more than last years.\"")
	await o.say("Sentry", "\"Hmm...so about 6 to 7 computers.\"")
	await o.say("Sentry", "\"Yes! I think that would be enough!\"")
	await o.say("YOU", "We take the amount we need from the storage, \n  making extra sure to lock up after.")
	await o.say("YOU", "After that we begin to walk back to the clubroom.")
	await o.say("Sentry", "\"We haven't seen Rav yet...\"")
	await o.say("Sentry", "\"I hope he's all right...I haven't seen him since noon.\"")
	await o.say("YOU", "\"So he's here today but hasn't shown up to club activities?\"")
	await o.say("Sentry", "\"Well...he...we had a discussion earlier.\"")
	await o.say("Sentry", "\"I don't know man.\"")
	await o.say("Sentry", "\"He just...started speaking nonsense.\"")
	await o.say("YOU", "\"Nonsense?\"")
	await o.say("Sentry", "\"I don't know, he said something \n  about KING and a false variable.\"")
	await o.say("Sentry", "\"Or something like that.\"")
	await o.say("Sentry", "\"I just hope he isn't like mad at me.\"")
	await o.say("YOU", "\"Maybe we could go look for him?\"")
	await o.say("Sentry", "\"That's not a bad idea, \n  then we can talk it out some more.\"")
	await o.say("YOU", "\"But shouldn't we go back with the computers first?\"")
	await o.say("Sentry", "\"you're right...\"")
	await o.say("Sentry", "\"Here let me take em!\"")
	await o.say("Sentry", "\"I can run back with them \n  and check if Rav came back.\"")
	await o.say("YOU", "\"Well in that case, I could look around the school a bit \n  while making my way back.\"")
	await o.say("Sentry", "\"And if he isn't at the club, I'll just go back \n  and we'll meet at some point.\"")
	await o.say("Sentry", "\"Yes, It's genius!\"")
	await o.say("Sentry", "\"Alright! I'll go then!\"")
	await o.say("YOU", "Sen takes the computers off my hands and runs down the hall, \n  how he somehow manages to not drop any of them is beyond me.")
	await o.say("YOU", "I was as he slowly disappears down the hall, \n  leaving me alone in a far corner of the school.")
	await o.say("YOU", "I begin to walk back towards the club like we planned. \n  While also looking down other hallways, stairs \n  and even into other classroom for any sign of Ravager.")
	await o.say("YOU", "Strangely though there doesn't seem to be anyone else. \n  The place is completely deserted.")
	await o.say("YOU", "Just as I thought I was the only one left in the school, \n  a familiar face shows up.")
	await o.say("YOU", "\"Ravager?\"")
	await o.say("YOU", "\"Where have you been, King is looking for you-\"")
	await r.say("Ravager", "\"SHHH\"")
	await r.say("Ravager", "\"Don't say my name, he might hear you.\"")
	await o.say("YOU", "\"What?\"")
	await r.say("Ravager", "\"They are up to something.\"")
	await r.say("Ravager", "\"Those two...no.\"")
	await r.say("Ravager", "\"That thing isn't our friend anymore.\"")
	await r.say("Ravager", "\"It's not what you think it is.\"")
	await r.say("Ravager", "\"Don't let it fool you.\"")
	await r.say("Ravager", "\"It's already fooled them.\"")
	await o.say("YOU", "\"What are you talking about...?\"")
	await r.say("Ravager", "\"I don't know the others that well, but maybe.\"")
	await r.say("Ravager", "\"You can help me convince them...\"")
	await r.say("Ravager?", "\"NO\"")
	await r.say("Ravager?", "\"!T'S TO0 L5T3 FOR TH#T NOW\"")
	await o.say("", "D0NT L#T HIM G3T !N YOUR H€@D")
	#Screen flashes and Ravager is gone.
	var f = ColorRect.new()#laver farve firkant
	f.color = Color.WHITE#laver firkant hvid
	f.set_anchors_preset(Control.PRESET_FULL_RECT)#Sætter L B til skærmstørrelse
	add_child(f)#tilføj firkant
	var t = create_tween()#tween (transition)
	t.tween_property(f, "modulate:a", 0.0, 1.0)#giver den en kommando
	t.tween_callback(f.queue_free)#Når den er færdig fjerner den objektet
	await o.say("YOU", "Without warning Ravager takes off leaving you in the hallway, \n  what a shame.")
	await o.say("", "WHAT ARE YOU WAITING FOR, GET BACK TO IT.")
	await o.say("YOU", "\"Ravager?\"")
	await o.say("", "...")
	await o.say("YOU", "What even is the time? Maybe I should get back to the others.")
	get_tree().change_scene_to_file("res://set_dressing_branch_3.tscn")

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
