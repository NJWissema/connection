extends Node2D

@export var bodies : Array[PlayerBody]
@export var lines : Array[BodyConnection]

# Called when the node enters the scene tree for the first time.
func _ready():
	#line.clear_points()
	#for body in bodies:
		#line.add_point(body.global_position)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#for i in range(line.get_point_count()):
		#line.set_point_position(i,bodies[i].global_position)
	pass
