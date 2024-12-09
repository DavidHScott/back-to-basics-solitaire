extends Node2D

var card_on_top_of_me:Card = null


func can_add_card(p_card:Card):
	if(card_on_top_of_me == null):
		# Can place a king (13)
		if(p_card.value == 13):
			return true
	
	return false


func place_card_onto(p_card:Card):
	card_on_top_of_me = p_card
	p_card.global_position = self.global_position
