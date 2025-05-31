@tool
class_name BodyConnection extends Line2D

#signal connection_achieved(Line:BodyConnection, CurrentLength: float, DesiredLength:float)

@export var max_length: float = 200.0
@export var desired_length: float = 50.0
@export var breakable: bool = true

@export var body1: PlayerBody
@export var body2: PlayerBody

@export var debug_printing = false
@export var debug_length_display = false
@export var debug_percentage_display = false

var connected: bool = false
var broken: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if self.get_point_count() == 0 and body1!= null and body2 != null:
		self.add_point(body1.global_position)
		self.add_point(body2.global_position)

func get_percentage(pos1: Vector2, pos2: Vector2) -> float:
	var length = pos1.distance_to(pos2)
	return (length - desired_length) / (max_length - desired_length)

func get_colour(percentage: float) -> Color:
	return Color(percentage, (1 - percentage), 0, 1.4 - percentage)

func _process(_delta):
	if body1!= null and body2 != null:
		self.set_point_position(0, body1.global_position)
		self.set_point_position(1, body2.global_position)

func _physics_process(_delta):
	if body1!= null and body2 != null:
		var percentage = get_percentage(body1.global_position, body2.global_position)
		self.default_color = get_colour(percentage)
		self.width = 0.5 + (1-percentage) * 4
		
		if debug_printing:
			print(self.default_color)
		if debug_length_display:
			print(body1.global_position.distance_to(body2.global_position))

		connected = (true if percentage <= 0 else false)
		if connected:
			self.default_color = Color.BLUE
		if breakable:
			broken = (true if percentage >= 1 else false)
