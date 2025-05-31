class_name Level extends Node2D


@export var level_name: String = "Level"

@export var bodies : Array[PlayerBody]
@export var lines : Array[BodyConnection]

@export var nextLevel: PackedScene = null

@onready var play_area := $PlayLayer
@onready var pause_menu := $UILayer/PauseMenu
@onready var loss_menu := $UILayer/LossMenu
@onready var win_menu := $UILayer/WinMenu

var won: bool = false
var lost: bool = false

var game_paused: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$UILayer/LevelTextLabel.text = level_name

func display_victory():
	pause_game()
	win_menu.visible = true
	if nextLevel != null:
		$UILayer/WinMenu/MarginContainer/VBoxContainer/NextLevel.disabled = false

func display_loss():
	pause_game()
	loss_menu.visible = true

func pause_game():
	if !game_paused:
		game_paused = true
		play_area.process_mode = PROCESS_MODE_DISABLED

func unpause_game():
	if game_paused:
		game_paused = false
		play_area.process_mode = PROCESS_MODE_INHERIT

func restart_game():
	get_tree().reload_current_scene()

func open_pause_menu():
	pause_game()
	pause_menu.visible = true

func close_pause_menu():
	pause_menu.visible = false
	unpause_game()


func _input(_event):
	if Input.is_action_pressed('escape'):
		open_pause_menu()
	if Input.is_action_just_pressed("right_click"):
		unselect_all()

	
func _physics_process(_delta):
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
		

func unselect_all():
	for body in bodies:
		body.un_select()

#Pause game
func _on_pause_pressed():
	open_pause_menu()

#Resume game
func _on_resume_pressed():
	close_pause_menu()

#Restart the instance
func _on_restart_pressed():
	restart_game()

#To go back to main menu
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

#To go to next level
func _on_next_level_pressed():
	if nextLevel != null:
		get_tree().change_scene_to_packed(nextLevel)
