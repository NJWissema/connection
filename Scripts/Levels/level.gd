class_name Level extends Node2D



@export var level_name: String = "Level"

@export var bodies : Array[PlayerBody]
@export var lines : Array[BodyConnection]

@onready var play_area := $PlayLayer

var won: bool = false
var lost: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$UILayer/LevelTextLabel.text = level_name



func display_victory():
	pause_game()

func display_loss():
	unpause_game()

func pause_menu():
	pause_game()

func pause_game():
	play_area.process_mode = PROCESS_MODE_DISABLED

func unpause_game():
	play_area.process_mode = PROCESS_MODE_INHERIT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if !won and !lost:
		var level_won: bool = true
		var level_lost: bool = false
		for line in lines:
			level_won = (false if line.connected==false else level_won)
			level_lost = (true if line.breakable and line.broken else level_lost)
		
		won = level_won
		lost = level_lost
		if won:
			display_victory()
		if lost:
			display_loss()
		
	
