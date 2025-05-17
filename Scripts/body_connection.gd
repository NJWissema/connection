class_name BodyConnection extends Line2D

signal connection_achieved(Line:BodyConnection, CurrentLength: float, DesiredLength:float)

@export var max_length: float = 200.0
@export var desired_length: float = 50.0

@export var body1: PlayerBody
@export var body2: PlayerBody

@export var debug_printing = false
@export var debug_length_display = false
@export var debug_percentage_display = false

var connected: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_point(body1.global_position)
	self.add_point(body2.global_position)
	#default_color = get_colour(body1.global_position, body2.global_position)
	pass # Replace with function body.


func get_percentage(pos1: Vector2, pos2: Vector2) -> float:
	var length = pos1.distance_to(pos2)
	return (length - desired_length) / (max_length - desired_length)

func get_colour(percentage: float) -> Color:
	return Color(percentage, (1 - percentage), 0, 1 if percentage <= 1 else 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.set_point_position(0, body1.global_position)
	self.set_point_position(1, body2.global_position)
	
	var percentage = get_percentage(body1.global_position, body2.global_position)
	connected = (true if percentage <= 1 else false)
	
	self.default_color = get_colour(percentage)
	if debug_printing:
		print(self.default_color)
