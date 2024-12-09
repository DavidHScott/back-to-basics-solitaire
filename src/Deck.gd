extends Node2D

# Treat this like a stack. TOP CARD IS ON THE BOTTOM
var stock_card_stack = Array([], TYPE_OBJECT, "Card", Card)
var waste_card_stack = Array([], TYPE_OBJECT, "Card", Card)

var Stock:Node2D
var Waste:Node2D



# Only called at the START of a game
func shuffle_deck():
	
	
	pass


# Add a card to the TOP of the deck (Append to the END)
func add_card_to_deck(p_new_card:Card):
	pass


# Draw the TOP card from the deck (The LAST card in the stack)
func draw_from_deck():
	pass


func cycle_into_waste():
	pass
