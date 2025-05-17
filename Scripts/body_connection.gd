class_name BodyConnection extends Line2D

signal connection_achieved(Line:BodyConnection, CurrentLength: float, DesiredLength:float)

@export var max_length: float = 200.0
@export var desired_length: float = 50.0

@export var body1: PlayerBody
@export var body2: PlayerBody
# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_point(body1.global_position)
	self.add_point(body2.global_position)
	pass # Replace with function body.

func get_length(pos1: Vector2, pos2: Vector2)-> float : 
	return 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.set_point_position(0, body1.global_position)
	self.set_point_position(1, body2.global_position)
	
	
	
	#default_color = Color()
