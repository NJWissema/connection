class_name PlayerBody extends CharacterBody2D

signal node_selected(body:PlayerBody)

var selected = false

@export var speed = 200
@export var friction = 0.1
@export var acceleration = 0.1

@onready var body_sprite := $BodySprite

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
	if Input.is_action_pressed('left'):
		input.x -= 1
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1
	return input

func _physics_process(_delta):
	var direction = get_input()
	if direction.length() > 0 and selected:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()

func swap_select():
	if selected:
		un_select()
	else:
		select()

func select():
	selected = true
	highlight()
	node_selected.emit(self)

func un_select():
	selected = false
	unhighlight()

func highlight():
	body_sprite.set_modulate(Color(0.8,0.5,0.5,1))

func unhighlight():
	body_sprite.set_modulate(Color(1,1,1,1))

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		swap_select()
