/obj/item/stack/sheet
	name = "sheet"
	lefthand_file = 'icons/mob/inhands/misc/sheets_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/sheets_righthand.dmi'
	full_w_class = WEIGHT_CLASS_NORMAL
	force = 5
	throwforce = 5
	max_amount = 50
	throw_speed = 1
	throw_range = 3
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "smashed")
	novariants = FALSE
	var/perunit = MINERAL_MATERIAL_AMOUNT
	var/sheettype = null //this is used for girders in the creation of walls/false walls
	var/is_fabric = FALSE //is this  a valid material for the loom?
	var/loom_result //result from pulling on the loom
	var/pull_effort = 0 //amount of delay when pulling on the loom