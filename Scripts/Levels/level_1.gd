extends Node2D

@export var bodies : Array[PlayerBody]

@onready var line := $ConnectingLine

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#line.points = [body_1.global_position, body_2.global_position]
	pass
