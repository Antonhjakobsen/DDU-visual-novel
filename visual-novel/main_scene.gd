class_name SetDressing extends Control

#loader karakterene som scener
const CHARA1 = preload("res://character_example.tscn")
const CHARA2 = preload("res://character_example2.tscn")
const CHARA3 = preload("res://character_example_3.tscn")

func _ready() -> void:
	#instantiater karakterene
	var o:VNCharacter=CHARA1.instantiate()
	#tilføjer dem til scenen
	add_child(o)
	
	#kommandoer som kan udføres:
	#_.snap(%position)
	#_.move(%position,tid brugt på bevægelse)
	#_.say("navn", "Hvad der skal siges") (brug \n til at gå en linje ned og tilføj 2 mellemrum)
	#_.flip_(h/v)=(true/false)
	#_.attr("navn på alternativ udseende på karakter")
	#await venter på den sidste kommando er færdig til at udføre den næste
	o.snap(%far_left)
	%background.texture=load("res://backgrounds/Classroom.png")
	var transition1=create_tween()
	transition1.tween_property(%background, "modulate:a", 0, 0)
	transition1.tween_property(%background, "modulate:a", 1, 2)
	await o.move(%far_left,2.5)
	await o.say("Self","It’s only been a few weeks since I’ve started high school.\n  So far high school life has been as dull as I expected. \n  It’s nothing like how it is in manga.")
	await o.say("Self","I still have to join a club soon,\n  I’ve been waiting it out for a good while now.\n  It’s practically been pushed to the back of my mind.")
	await o.say("Self","I could continue to wait till the festival, \n  all the different clubs should be at their \n  best marketing-wise then.")
	await o.say("Self","But, it would be embarrassing to be walking around\n  as one of those clubless. Especially if everyone else \n  has already found a club.")
	await o.say("Self","Yeah, that’s definitely not happening.")
	await o.say("Self","But what kind of club should I even join? \n  Perhaps something that doesn’t require much. \n  Like some kind of manga or anime club.")
	await o.say("Self","If we even have clubs like that…")
	await o.say("Self","Guess I really have to go around looking after school.")
	#After class finishes, I continue to sit at my desk and wait a bit longer. Building up the courage to go club hunting
	await o.say("Self","I would rather not have my classmates think\n  I’m some loser. After all, I only go home and do nothing\n  but play video games.")
	var transition2=create_tween()
	transition2.tween_property(%background, "modulate:a", 0, 1.5)
	await o.move(%far_left,2)
	%background.texture=load("res://backgrounds/HallwayLeftToRight.png")
	var transition3=create_tween()
	transition3.tween_property(%background, "modulate:a", 0, 0)
	transition3.tween_property(%background, "modulate:a", 1, 1.5)
	await o.move(%far_left,2)
	#Not long after dismissal, everyone funneled out the classroom, heading to their own after school activities.
	#await o.say("Self","I wait for the coast to be clear before I make my move.")
	#I gather my belongings and leave like everyone else. Except this time, I’m not going home.
	#await o.say("Self","I walk down the hallway. I can’t help but feel out of place, even though I’ve been here multiple times every day. It feels like I took a wrong turn on a familiar road.")
	await o.say("Self","I’ve already passed a few clubs by now, \n  but none of them stood out to me.")
	await o.say("Self","Luckily no one's seen me out here yet. \n  The worst thing that could happen right now is-")
	await o.move(%leftishUpleftUp,0.5)
	await o.move(%leftish,0.5)
	await o.say("Sen","CRAP I’M GONNA BE LATE!!!")
	await o.say("Self","Then, like clockwork I run into an old friend, \n  the one thing I was trying to avoid.")
	await o.say("Self","He’s running through the halls like a complete lunatic, \n  almost running straight into me.")
	await o.say("","")
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
