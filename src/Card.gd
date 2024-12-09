class_name Card extends Node2D


var sprite:Sprite2D
var anim:AnimationPlayer
var collider:CollisionShape2D

@export var placed_at:Node2D

@export var face_tex:Texture2D
var back_tex

@export var default_back_tex:Texture2D


enum suites
{
	hearts,
	diamonds,
	spades,
	clubs
}

var suite:suites
var value:int

# 0/false = Face down. 1/true = Face Up
var facing_up:bool = false
var is_dragging:bool = false

var target_pos:Vector2 = self.position


var card_on_top_of_me:Card = null



# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("Face")
	anim = get_node("AnimationPlayer")
	collider = get_node("CollisionShape2D")


func initialize(p_value:int, p_suite:suites, p_is_facing_up:bool, p_face_tex:Texture2D, p_back_tex:Texture2D = default_back_tex):
	value = p_value
	suite = p_suite
	facing_up = p_is_facing_up
	face_tex = p_face_tex
	back_tex = p_back_tex


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_dragging):
		var target_pos = get_viewport().get_mouse_position()
		self.global_position = Vector2(target_pos.x, target_pos.y)
	
	pass


func switch_texture():
	if(facing_up == false):
		sprite.texture = face_tex
		facing_up = true
	else:
		sprite.texture = back_tex
		facing_up = false


func flip():
	anim.play("Flip", -1, 2.0)
		
	if(facing_up == false):
		collider.set_process(false)
	else:
		collider.set_process(true)


func can_add_card(p_card:Card):
	if(facing_up == false || card_on_top_of_me != null):
		return false
	
	
	if(self.suite == suites.clubs || self.suite == suites.spades):
		if(p_card.suite == suites.clubs || p_card.suite == suites.spades):
			return false
	
	if(self.suite == suites.diamonds || self.suite == suites.hearts):
		if(p_card.suite == suites.diamonds || p_card.suite == suites.hearts):
			return false
	
	
	if(p_card.value != self.value + 1):
		return false
	
	return true


func place_card_onto(p_card:Card):
	pass



func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			is_dragging = true
		if(event.button_index == MOUSE_BUTTON_LEFT and !event.pressed):
			is_dragging = false
			self.global_position = placed_at.global_position


# Just used when the mouse is also holding
func _on_mouse_entered():
	pass # Replace with function body.
